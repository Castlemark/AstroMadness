extends Sprite

var menu_scene : Resource = preload("res://Assets/Scenes/UI.tscn")

func _ready():
	pass

func _on_animation_finished(anim_name: String) -> void:
	GameManager.go_to_scene(menu_scene)
