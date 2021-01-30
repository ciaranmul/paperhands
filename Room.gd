extends Node

class_name Room

var _has_wallet: bool setget set_has_wallet, get_has_wallet
var _has_private_key: bool setget set_has_private_key, get_has_private_key
var _adjacent_rooms = []

func get_has_wallet() -> bool:
	return _has_wallet

func set_has_wallet(value: bool):
	_has_wallet = value

func get_has_private_key() -> bool:
	return _has_private_key

func set_has_private_key(value: bool):
	_has_private_key = value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
