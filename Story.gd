extends Node

class_name Story

var _heading: String setget ,get_heading
var _body: String
var _is_true: bool setget ,get_is_true
var _was_shown: bool setget set_was_shown, get_was_shown


func get_body() -> String:
	return _body

func get_heading() -> String:
	return _heading

func get_is_true() -> bool:
	return _is_true

func get_was_shown() -> bool:
	return _was_shown

func set_was_shown(value: bool):
	_was_shown = value

func _init(heading: String, body: String, is_true: bool):
	_heading = heading
	_body = body
	_is_true = is_true
	_was_shown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
