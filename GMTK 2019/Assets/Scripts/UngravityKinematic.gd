extends KinematicBody2D
class_name UngravityKinematic

var gravity_direction : Vector2
var gravity_force : float
var motion : Vector2

func _ready():
	gravity_force = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY)

func _physics_process(delta):
	motion = move_and_slide( gravity_direction * gravity_force, gravity_direction * -1, true )