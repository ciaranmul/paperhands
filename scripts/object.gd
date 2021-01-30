extends Area2D

export(String) var _name = "change me"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_object_input_event(viewport, event, shape_idx):
	var format_string = "clicked %s"
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print(format_string % _name)
		$SoundEffect.play()

