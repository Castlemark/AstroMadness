extends GravityKinematic

func _physics_process(delta):
	._physics_process(delta)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if ("Spikes" in collision.collider.name):
			if collision.collider.is_active():
				reset_level()

func reset_level():
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2.DOWN)
	var current_scene = get_tree().get_current_scene().filename
	get_tree().change_scene(current_scene)