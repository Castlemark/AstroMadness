extends Node2D

var splash : Resource = preload("res://Assets/Scenes/SplashScreen.tscn")

func _ready():
	yield(get_tree().create_timer(1.5), "timeout")
	GameManager.go_to_scene(splash)
