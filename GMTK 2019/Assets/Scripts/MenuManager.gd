extends Control

func _ready():
	$CenterContainer/Divider/Menu/Play.grab_focus()


func _on_Play_pressed() -> void:
	GameManager.go_to_next_level()


func _on_Tutorial_pressed() -> void:
	OS.shell_open("https://castlemark.github.io")
	print("loading tutorial")


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Rate_pressed():
	OS.shell_open("https://itch.io/jam/gmtk-2019")
