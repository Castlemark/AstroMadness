extends Node2D

export var normal_button : Texture
export var pushed_button : Texture
export var target_path : NodePath

var sprite : Sprite
var target

func _ready():
	sprite = $Sprite
	sprite.texture = normal_button
	
	target = get_node(target_path)

func _on_body_entered(body : PhysicsBody2D):
	toggle_sprite()
	target.toggle_activation()

func toggle_sprite():
	if sprite.texture == normal_button:
		sprite.texture = pushed_button
	else:
		sprite.texture = normal_button