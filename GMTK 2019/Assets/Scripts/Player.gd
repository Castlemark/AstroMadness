extends GravityKinematic

func _physics_process(delta):
	._physics_process(delta)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if ("Spikes" in collision.collider.name):
			if collision.collider.is_active():
				GameManager.reset_level()