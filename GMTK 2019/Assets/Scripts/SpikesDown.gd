extends UngravityKinematicDown

func _ready():
	_on_activation_changed()

func _on_activation_changed():
	print("toggling final")
	if active:
		$Sprite.set_texture(load("res://Assets/Sprites/hazards-spikes1.png"))
		$CollisionShape2D.set_disabled(false)
	else:
		$Sprite.set_texture(load("res://Assets/Sprites/hazards-spikes2.png"))
		$CollisionShape2D.set_disabled(true)
