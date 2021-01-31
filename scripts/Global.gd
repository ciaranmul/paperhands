extends Node

var current_scene = null
var _fx_volume = 50 setget set_fx_volume,get_fx_volume
var _music_volume = 50 setget set_music_volume,get_music_volume

func set_fx_volume(volume: int):
	_fx_volume = volume

func get_fx_volume() -> int:
	return _fx_volume

func set_music_volume(volume: int):
	_music_volume = volume

func get_music_volume() -> int:
	return _music_volume

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
