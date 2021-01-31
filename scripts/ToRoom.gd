extends Area2D

class_name ToRoom

export(String) var _next_scene: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ToRoom_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.goto_scene("res://rooms/%s.tscn" % _next_scene)
