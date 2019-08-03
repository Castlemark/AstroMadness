extends Node2D

func reset_level():
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2.DOWN)
	var current_scene = get_tree().get_current_scene().filename
	get_tree().change_scene(current_scene)