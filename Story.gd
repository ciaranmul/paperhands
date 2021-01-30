extends Node

class_name Story

var _heading: String setget ,get_heading
var _file_path: String
var _is_true: bool setget ,get_is_true
var _was_shown: bool setget set_was_shown, get_was_shown


func get_body() -> String:
	var body = "[file not read]"
	var f = File.new()
	f.open(_file_path, File.READ)
	while not f.eof_reached():
		body = f.get_line()
	return body

func get_heading() -> String:
	return _heading

func get_is_true() -> bool:
	return _is_true

func get_was_shown() -> bool:
	return _was_shown

func set_was_shown(value: bool):
	_was_shown = value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
