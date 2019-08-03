extends Node2D

class_name moving_objects

func _input(event: InputEvent) -> void:
	var grav_dir : Vector2 = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR)
	
	if ( !is_anyone_moving() ):
	
		if event.is_action_pressed("ui_down"):
			grav_dir = Vector2(0, 1)
		elif event.is_action_pressed("ui_up"):
			grav_dir = Vector2(0, -1)
		elif event.is_action_pressed("ui_left"):
			grav_dir = Vector2(-1, 0)
		elif event.is_action_pressed("ui_right"):
			grav_dir = Vector2(1, 0)
	
		Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, grav_dir)


func is_anyone_moving() -> bool:
	
	for child in self.get_children():
		if child.is_moving():
			return true
	
	return false