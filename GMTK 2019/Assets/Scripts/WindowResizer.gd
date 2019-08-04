extends Node2D

class_name WindowResizer

export var size : int = 16
const PX_PER_TILE : int = 8

func _ready() -> void:
	get_viewport().size = Vector2(self.size * PX_PER_TILE, self.size * PX_PER_TILE)
	get_tree().root.connect("size_changed", self, "on_window_resize")


func on_window_resize():
	get_viewport().size = Vector2(self.size * PX_PER_TILE, self.size * PX_PER_TILE)
