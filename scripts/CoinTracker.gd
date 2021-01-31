extends Node

class_name CoinTracker

var _fait_value: float setget , get_fait_value


func increase_price(delta: float):
	_fait_value += delta

func decrease_price(delta: float):
	_fait_value -= delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_fait_value():
	return _fait_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
