extends Node2D

export var normal_button : Texture
export var pushed_button : Texture
export var target_path : NodePath

var sprite : Sprite
var target : Node

func _ready():
	sprite = $Sprite
	sprite.texture = normal_button
	
	#target = get_node(target_path)

func _on_body_entered(body : PhysicsBody2D):
	sprite.texture = pushed_button
	#target.deactivate()

func _on_body_exited(body : PhysicsBody2D):
	sprite.texture = normal_button
	#target.activate()