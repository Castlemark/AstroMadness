extends KinematicBody2D

var grav_str: float

var is_moving : bool
var _prev_pos : Vector2

func _ready() -> void:
	is_moving = true
	grav_str = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY)
	_prev_pos = Vector2(-50, -50)


func _physics_process(delta: float) -> void:
	var grav_dir : Vector2 = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR) * -1.0
	
	if _prev_pos == position:
		is_moving = false
	else:
		is_moving = true
	
	move_and_collide(grav_dir*grav_str*delta, false)