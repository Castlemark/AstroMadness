extends GravityKinematic

var prev_motion : float

func _ready():
	._ready()
	prev_motion = 0
	grav_str *= 0.5

func _process(delta):
	._process(delta)
	if self.motion.length() != 0:
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

func is_moving():
	
	if motion.length() == 0 and prev_motion != 0:
		$AudioStreamPlayer.play(0.0)
	prev_motion = motion.length()
	.is_moving()
