extends GravityKinematic

func _ready():
	._ready()
	grav_str *= 0.5

func _process(delta):
	._process(delta)
	if self.is_moving():
		$astronaut.play("fall")
	else:
		$astronaut.play("idle")

func _physics_process(delta):
	._physics_process(delta)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if ("Spikes" in collision.collider.name):
			if collision.collider.is_active():
				GameManager.reset_level()
