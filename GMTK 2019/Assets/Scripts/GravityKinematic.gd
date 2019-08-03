extends KinematicBody2D
class_name GravityKinematic

var grav_str : float
var grav_dir : Vector2 
var direction : float = 1
var motion : Vector2

func _ready():
	grav_str = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY)


func _process(delta):
	grav_dir = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY_VECTOR)
	

func _physics_process(delta):
	motion = move_and_slide( grav_dir * grav_str * direction, grav_dir * direction * -1, true )

func is_moving():
	return motion.length() != 0