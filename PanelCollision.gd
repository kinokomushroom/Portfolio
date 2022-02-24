extends CollisionShape2D


onready var animationplayer: AnimationPlayer = $FootprintAnimation
onready var footprints: Sprite = $Footprints


func show_footprints():
	footprints.visible = true
	animationplayer.seek(0)
	animationplayer.play("footprints")


func hide_footprints():
	footprints.visible = false
	animationplayer.stop()


func _ready():
	pass
