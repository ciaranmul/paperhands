extends Node

class_name Phone

var _story_manager: StoryManager
var _coin_tracker: CoinTracker
var _displayed_story: Story
var was_correct: bool
var answered: bool = false
var refresh_text_flag: bool = false

func show_story():
	_displayed_story = $StoryManager.get_current_story()
	$StoryText.text = _displayed_story.get_body()
	$Headline.text = _displayed_story.get_heading()
	#$StoryText.show()

func vote_on_story(vote: bool):
	was_correct = $StoryManager.evaluate_vote(vote)
	_modify_coin_value(was_correct)
	play_result_sound(was_correct)
	$TimeBetweenStories.start()
	answered = true
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass#show_story()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if refresh_text_flag == true:
		if $TimeOnStory.time_left > 0:
			$TimeLeft.text = "Seconds Before Short: " + str(int($TimeOnStory.time_left))
		elif !answered:
			$TimeLeft.text = "Shorted"
			$TextCooldown.start()
			$TimeOnStory.stop()
			refresh_text_flag = false
		elif was_correct and answered:
			$TimeLeft.text = "To The Moon!"
			$TextCooldown.start()
			$TimeOnStory.stop()
			refresh_text_flag = false
		elif !was_correct and answered:
			$TimeLeft.text = "Paperhands"
			$TextCooldown.start()
			$TimeOnStory.stop()
			refresh_text_flag = false
	else:
		if $TextCooldown.time_left == 0:
			$TimeLeft.text = "Bitcoin Value: " + str($CoinTracker.get_fait_value())
			$Headline.text = "Stonk Machine"
			$StoryText.text = ""
	
		
	#if $TimeBetweenStories 



func _modify_coin_value(was_correct: bool):
	if was_correct:
		$CoinTracker.increase_price(_generate_value_delta())
	else:
		$CoinTracker.decrease_price(_generate_value_delta())

func _generate_value_delta() -> float:
	return 0.1

#Recieve upvote/downvote input when button is clicked only when a story is shown and TimeBetweenStories counter is at 0
func _on_Upvote_input_event(viewport, event, shape_idx):
	var format_string = "clicked %s"
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and $TimeBetweenStories.time_left == 0:
		$TimeOnStory.stop()
		vote_on_story(true)

func _on_Downvote_input_event(viewport, event, shape_idx):
	var format_string = "clicked %s"
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and $TimeBetweenStories.time_left == 0:
		$TimeOnStory.stop()
		vote_on_story(false)
		
#Play relative correct incorrect sounds based on the story
func play_result_sound(was_correct):
		#https://freesound.org/people/original_sound/sounds/366102/
		if was_correct == true:
			$Correct.play()
		else:
			#https://freesound.org/people/rhodesmas/sounds/342756/
			$Incorrect.play()
	
#Timer to tell when to trigger a new story and play the mobile vibration sound
func _on_TimeBetweenStories_timeout():
	
	refresh_text_flag = true
	#Stop timer so a new story is not already counting down before the vote has been given
	$TimeBetweenStories.stop()
	#https://freesound.org/people/SmartWentCody/sounds/179012/
	$TimeBetweenStories/VibrateSound.play()
	show_story()
	#Start TimeOnStory timer so as to give a limited time on the story before an answer is required
	$TimeOnStory.start()
	
#If TimeOnStory runs out before there is an input the coin value is reduced and the countdown to the next story begins
func _on_TimeOnStory_timeout():
	$TimeOnStory.stop()
	answered = false
	_modify_coin_value(false)
	$TimeBetweenStories.start()
 # Replace with function body.


func _on_TextCooldown_timeout():
	$TextCooldown.stop()
