extends Node

class_name StoryFactory

export(String) var _stories_root_path = "res://stories/"

func get_stories() -> Array:
	var stories = []
	var dir = Directory.new()
	if dir.open(_stories_root_path) == OK:
		dir.list_dir_begin()
		var file_path = dir.get_next()
		while file_path != "":
			stories.append(_get_story_from_path(file_path))
			file_path = dir.get_next()
	else:
		print("StoryFactory: An error occured when trying to access path.")
	
	return stories

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _get_story_from_path(path: String) -> Story:
	var json = ""
	var f = File.new()
	f.open(path, File.READ)
	while not f.eof_reached():
		json += f.get_line()
		json += " "
	return _get_story_from_json(json)

func _get_story_from_json(json: String) -> Story:
	var p = JSON.parse(json)
	if typeof(p.result) == TYPE_DICTIONARY:
		return Story.new(p.result["heading"], p.result["body"], p.result["is_true"])
	else:
		print("StoryFactory: expected a dictionary result")
		return Story.new("", "", false)
		
