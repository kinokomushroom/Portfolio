extends Node2D


onready var video_player: VideoPlayer = $Viewport/VideoPlayer


func _ready():
	video_player.play()
	$Temp.visible = false
	video_player.paused = true
	video_player.modulate = Color.black
	
	var viewport_texture: ViewportTexture = $Viewport.get_texture()
	$Video.texture = viewport_texture
	$ProjectorLight.material.set_shader_param("Video", viewport_texture)


# triggered when player gets within range
# turn on projector and resume playback
func _on_EventTriggerArea_body_entered(body):
	video_player.paused = false
	video_player.modulate = Color.white


# triggered when player exits range
# turn off projector and pause playback
func _on_EventTriggerArea_body_exited(body):
	video_player.paused = true
	video_player.modulate = Color.black


# reset video when playback ends
func _on_VideoPlayer_finished():
	video_player.play()

