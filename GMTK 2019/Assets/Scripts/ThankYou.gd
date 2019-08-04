extends Control

func _ready():
	pass


func _on_Rating_pressed() -> void:
	OS.shell_open("https://castlemark.github.io")
