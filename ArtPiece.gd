extends StaticBody2D


var panel_path: NodePath = "../../ArtPanelLayer/ArtPanel"
onready var panel = get_node(panel_path)

export var title: String = "Title"
export var content_image: Texture
export(String, MULTILINE) var japanese_description = "日本語説明"
export(String, MULTILINE) var english_description = "English description"
export var tools_used: String = ""
export var video_link: String = ""
export var original_link: String = ""
export var download_link: String = ""
export var source_link: String = ""

onready var animationplayer: AnimationPlayer = $PanelTriggerArea/CollisionShape2D/FootprintAnimation
onready var footprints: Sprite = $PanelTriggerArea/CollisionShape2D/Footprints


func _ready():
	$PanelTriggerArea.connect("body_entered", panel, "_on_PanelTriggerArea_body_entered", [title, content_image, japanese_description, english_description, tools_used, video_link, original_link, download_link, source_link])
	$PanelTriggerArea.connect("body_exited", panel, "_on_PanelTriggerArea_body_exited")
	
	footprints.visible = false
	animationplayer.stop()


# triggered when player gets within range
# turn on footprints
func _on_EventTriggerArea_body_entered(body):
	footprints.visible = true
	animationplayer.seek(0)
	animationplayer.play("footprints")


# triggered when player exits range
# turn off footprints
func _on_EventTriggerArea_body_exited(body):
	footprints.visible = false
	animationplayer.stop()
