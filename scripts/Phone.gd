extends Node

class_name Phone

var _story_manager: StoryManager
var _coin_tracker: CoinTracker

func show_story():
	pass

func vote_on_story(vote: bool):
	var was_correct = _story_manager.evaluate_vote(vote)
	_modify_coin_value(was_correct)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _modify_coin_value(was_correct: bool):
	if was_correct:
		_coin_tracker.increase(_generate_value_delta())
	else:
		_coin_tracker.decrease(_generate_value_delta())

func _generate_value_delta() -> float:
	return 0.1
