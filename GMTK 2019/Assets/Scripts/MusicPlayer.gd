extends AudioStreamPlayer2D

var song = preload("res://Assets/Audio/Music/Catch the mystery 120 BPM.wav")

func _ready():
	self.stream = song
	self.autoplay = true
	self.volume_db = -20.0
