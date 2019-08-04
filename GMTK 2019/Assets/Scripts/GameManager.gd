extends Node2D

var level_idx : int

func _ready() -> void:
	level_idx = 0
	
	OS.window_size = Vector2( 720, 720)
	OS.window_position -= OS.window_size/2

func reset_level():
	ResetPlayer.play(0.0)
	var current_scene = get_tree().get_current_scene().filename
	get_tree().change_scene(current_scene)

func go_to_next_level():
	call_deferred("_deferred_go_to_next_level")

func _deferred_go_to_next_level():
	var root = get_tree().get_root()
	var current_scene : Node = root.get_child(root.get_child_count() - 1)
	
	level_idx += 1
	var scene : Resource = load("res://Assets/Scenes/Levels/Level_" + str(level_idx) + ".tscn")
	
	if scene == null:
		print("Go to end screen")
	else:
		print("going to level " + str(level_idx))
		
		current_scene.free()
		current_scene = scene.instance()
		
		get_tree().get_root().add_child(current_scene)
		get_tree().set_current_scene(current_scene)
		Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2.DOWN)

func _input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
	if event.is_action_pressed("mute"):
		if MusicPlayer.is_playing():
			MusicPlayer.stop()
			if get_tree().get_current_scene().has_node("MusicIco"):
				get_tree().get_current_scene().get_node("MusicIco").set_texture(load("res://Assets/Sprites/music2.png"))
		else:
			MusicPlayer.play()
			if get_tree().get_current_scene().has_node("MusicIco"):
				get_tree().get_current_scene().get_node("MusicIco").set_texture(load("res://Assets/Sprites/music1.png"))