extends KinematicBody2D
class_name UngravityKinematic

signal on_activation_changed

var gravity_direction : Vector2
var gravity_force : float
var motion : Vector2
export var active : bool

func _ready():
	gravity_force = Physics2DServer.area_get_param(get_world_2d().space,Physics2DServer.AREA_PARAM_GRAVITY)

func _physics_process(delta):
	return
	motion = move_and_slide( gravity_direction * gravity_force, gravity_direction * -1, true )

func toggle_activation():
	active = not active
	emit_signal("on_activation_changed")

func is_active():
	return active