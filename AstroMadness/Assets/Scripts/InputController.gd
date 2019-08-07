extends Node2D

class_name moving_objects

const DRAG_THRESHOLD : float = 5.0
const ANGLE_MARGIN : float = 20.0 / 90.0

var touch : Dictionary = {
	original_pos = 0.0,
	final_pos = 0.0,
	max_drag = 0.0,
	drag_started = false
}

func _input(event: InputEvent) -> void:
	var grav_dir : Vector2 = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR)
	var grav_dir_past = grav_dir
	
	if event.is_action_pressed("restart"):
			GameManager.reset_level()
	
	if ( !is_anyone_moving() ):
	
		if event.is_action_pressed("ui_down"):
			grav_dir = Vector2(0, 1)
		elif event.is_action_pressed("ui_up"):
			grav_dir = Vector2(0, -1)
		elif event.is_action_pressed("ui_left"):
			grav_dir = Vector2(-1, 0)
		elif event.is_action_pressed("ui_right"):
			grav_dir = Vector2(1, 0)
		
		var touch_dir : Vector2 =  _interpret_touchscreen(event)
		if touch_dir != Vector2(0, 0):
			grav_dir = touch_dir
	
		$Player.rotate( grav_dir_past.angle_to(grav_dir) )
		$Player.get_node( "astronaut" ).play("jump")
		
		Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, grav_dir)


func _interpret_touchscreen(event : InputEvent) -> Vector2:
	if event is InputEventScreenTouch:
		touch.drag_started = event.pressed
		
		if touch.drag_started:
			touch.original_pos = event.position
			
		elif not touch.drag_started and touch.max_drag > DRAG_THRESHOLD:
			touch.final_pos = event.position
			
			var angle : float = rad2deg((touch.final_pos - touch.original_pos).angle())/90.0
			
			if angle < (0.0 + ANGLE_MARGIN) and angle > (0.0 - ANGLE_MARGIN):
				print("east")
				return Vector2(1, 0)
			elif angle < (1.0 + ANGLE_MARGIN) and angle > (1.0 - ANGLE_MARGIN):
				print("south")
				return Vector2(0, 1)
			elif angle < (-1.0 + ANGLE_MARGIN) and angle > (-1.0 - ANGLE_MARGIN):
				print("north")
				return Vector2(0, -1)
			elif angle < (-2.0 +ANGLE_MARGIN) or angle > (2.0 - ANGLE_MARGIN):
				print("west")
				return Vector2(-1, 0)

	
	if event is InputEventScreenDrag and touch.drag_started:
		var relative : float = (event as InputEventScreenDrag).relative.length()
		
		if relative > touch.max_drag:
			touch.max_drag = relative
	
	return Vector2(0, 0)



func is_anyone_moving() -> bool:
	
	for child in self.get_children():
		if child.motion.length() != 0.0:
			return true
	
	return false