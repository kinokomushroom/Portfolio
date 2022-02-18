extends Node2D


onready var video_player: VideoPlayer = $Viewport/VideoPlayer


func _ready():
	video_player.play()
	video_player.paused = true
	video_player.modulate = Color.black


# triggered when player gets within range
# turns on TV
func _on_EventTriggerArea_body_entered(body):
	video_player.paused = false
	video_player.modulate = Color.white


# triggered when player exits range
# turns off TV
func _on_EventTriggerArea_body_exited(body):
	video_player.paused = true
	video_player.modulate = Color.black


# reset video when playback ends
func _on_VideoPlayer_finished():
	video_player.play()

