extends Control

func _ready():
	$CenterContainer/Divider/Menu/Play.grab_focus()
	pass

func _process(delta):
	get_node("CenterContainer").get_node("Divider/Menu/Options/Fullscreen").set_pressed(OS.window_fullscreen)


func _on_Play_pressed() -> void:
	GameManager.go_to_next_level()


func _on_Tutorial_pressed() -> void:
	print("loading tutorial")


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Fullscreen_toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = button_pressed
