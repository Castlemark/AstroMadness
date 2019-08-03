extends UngravityKinematicDown

func _ready():
	._ready()
	if active:
		start_beam()


func _process(delta):
	if active:
		cast_beam()


func start_beam():
	$Beam.add_point($BeamPosition.position)
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray($BeamPosition.global_position, $BeamPosition.global_position + transform.y * 1000, [self])
	if result:
		$Beam.add_point(transform.xform_inv(result.position))

func remove_beam():
	$Beam.remove_point(2)


func cast_beam():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray($BeamPosition.global_position + Vector2.RIGHT * 3, $BeamPosition.global_position + Vector2.LEFT * 64, [self])
	if result:
		$Beam.set_point_position(1, transform.xform_inv(result.position - Vector2.RIGHT * 3))
		if ("Player" in result.collider.name):
			GameManager.reset_level()


func _on_activation_changed():
	if active:
		start_beam()
	else:
		remove_beam()
