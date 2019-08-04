extends Control

func _ready():
	$CenterContainer/VBoxContainer/Rating.grab_focus()


func _on_Rating_pressed() -> void:
	OS.shell_open("https://itch.io/jam/gmtk-2019/rate/461702")
