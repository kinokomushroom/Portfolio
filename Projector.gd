extends Node2D


onready var video_player: VideoPlayer = $Viewport/VideoPlayer
export var dim_color: Color


func _ready():
	video_player.play()
	$Temp.visible = false
#	video_player.paused = true
	video_player.modulate = dim_color


# triggered when player gets within range
# brightens projector and resume playback
func _on_EventTriggerArea_body_entered(body):
#	video_player.paused = false
	video_player.modulate = Color.white


# triggered when player exits range
# dims projector and pause playback
func _on_EventTriggerArea_body_exited(body):
#	video_player.paused = true
	video_player.modulate = dim_color


# reset video when playback ends
func _on_VideoPlayer_finished():
	video_player.play()

