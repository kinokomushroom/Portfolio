extends Node2D


onready var video: Sprite = $Video
onready var video_player: VideoPlayer = $Viewport/VideoPlayer


func _ready():
	video_player.play()
	video_player.paused = true
	video.visible = false


# triggered when player gets within range
# turns on TV after waiting one frame
func _on_VideoPlayArea_body_entered(body):
	video_player.paused = false
	video.visible = true


# triggered when player exits range
# turns off TV
func _on_VideoPlayArea_body_exited(body):
	video_player.paused = true
	video.visible = false


# reset video when playback ends
func _on_VideoPlayer_finished():
	video_player.play()
