extends KinematicBody2D

var grav_str : float
var prova : String = "hola"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grav_str = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY)


func _physics_process(delta: float) -> void:
	var grav_dir : Vector2 = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR)
	
	move_and_collide(grav_dir*grav_str*delta)