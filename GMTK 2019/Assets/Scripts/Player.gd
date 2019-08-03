extends KinematicBody2D

var grav_str: float

var colliding : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grav_str = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY)
	colliding = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	
	var grav_dir : Vector2 = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR)
	
	var collision : KinematicCollision2D = move_and_collide(grav_dir*grav_str*delta, false)
	
	if collision != null:
		colliding = true
		print(collision.collider.name)
	elif collision == null:
		colliding = false
	
	#Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREAPARAMGRAVITYVECTOR, Vector2(0,0))
	
	

func _input(event: InputEvent) -> void:
	var grav_dir : Vector2 = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR)
	
	if colliding:
		if event.is_action_pressed("ui_down"):
			grav_dir = Vector2(0, 1)
		elif event.is_action_pressed("ui_up"):
			grav_dir = Vector2(0, -1)
		elif event.is_action_pressed("ui_left"):
			grav_dir = Vector2(-1, 0)
		elif event.is_action_pressed("ui_right"):
			grav_dir = Vector2(1, 0)
		
		Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, grav_dir)
	