extends Node

class_name Apartment

var _rooms = [] setget set_rooms, get_rooms

func set_rooms(rooms: Array):
	_rooms = rooms

func get_rooms() -> Array:
	return _rooms

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
