extends Control

func _ready():
	pass


func _on_Play_pressed() -> void:
	GameManager.go_to_next_level()


func _on_Tutorial_pressed() -> void:
	print("loading tutorial")


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Fullscreen_toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = button_pressed
