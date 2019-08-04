extends Node2D

func _ready():
	pass


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		$AudioStreamPlayer.play(0.0)
		yield($AudioStreamPlayer, "finished")
		GameManager.go_to_next_level()
