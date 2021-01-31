extends Node

class_name StoryManager

# interval between story presentations in seconds - configurable in editor between 1 and 5 minutes
export(int, 60, 300) var _story_interval = 120
var _stories = []
var _current_story: Story setget ,get_current_story
var _story_factory = StoryFactory.new()
var _number_of_stories: int
var _track_stories_shown: int = 0

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
	
	_track_stories_shown += 1
	
	#Loops randomly until an unshown sample is chosen
	while(was_shown == true and _track_stories_shown <= _number_of_stories):
		_current_story = _stories[rand_range(0, (_stories.size()))]
		was_shown = _current_story.get_was_shown()
	
	if(_track_stories_shown > _number_of_stories):
		_current_story = Story.new("MARKET CLOSED", "", false)
	
	_mark_story_as_shown()
	
	return _current_story


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init():
	_stories = _story_factory.get_stories()
	_number_of_stories = _stories.size()

func _mark_story_as_shown():
	_current_story.set_was_shown(true)
