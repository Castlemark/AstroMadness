extends Node2D

var children : Array

class_name GroupToggleable

func _ready():
	children = get_children()

func toggle_activation():
	for child in children:
		(child as UngravityKinematic).toggle_activation()