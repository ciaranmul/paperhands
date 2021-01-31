extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FxVolumeSlider_value_changed(value):
	Global.set_fx_volume(value)


func _on_MusicVolumeSlider_value_changed(value):
	Global.set_music_volume(value)
