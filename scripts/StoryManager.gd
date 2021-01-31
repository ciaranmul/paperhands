extends Node

class_name StoryManager

# interval between story presentations in seconds - configurable in editor between 1 and 5 minutes
export(int, 60, 300) var _story_interval = 120
var _stories = []
var _current_story: Story setget ,get_current_story
var _story_factory = StoryFactory.new()



func evaluate_vote(vote) -> bool:
	if _current_story.get_is_true():
		return vote
	else:
		return !vote

#Pick random story from array _stories which has not been chosen
func get_current_story() -> Story:

	#Ensure randomness
	randomize()
	var was_shown = true
	
	#Loops randomly until an unshown sample is chosen
	while(was_shown == true):
		_current_story = _stories[rand_range(0, (_stories.size()-1))]
		was_shown = _current_story.get_was_shown()
	
	_mark_story_as_shown()
	
	return _current_story

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init():
	_stories = _story_factory.get_stories()

func _mark_story_as_shown():
	_current_story.set_was_shown(true)
