extends Node2D


onready var video_player: VideoPlayer = $Viewport/VideoPlayer


func _ready():
	video_player.play()
	video_player.paused = true
	video_player.modulate = Color.black
	
	var viewport_texture: ViewportTexture = $Viewport.get_texture()
	$Video.material.set_shader_param("Video", viewport_texture)


# triggered when player gets within range
# turn on TV
func _on_EventTriggerArea_body_entered(body):
	video_player.paused = false
	video_player.modulate = Color.white


# triggered when player exits range
# turn off TV
func _on_EventTriggerArea_body_exited(body):
	video_player.paused = true
	video_player.modulate = Color.black


# reset video when playback ends
func _on_VideoPlayer_finished():
	video_player.play()

