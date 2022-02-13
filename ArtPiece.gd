extends StaticBody2D


var panel_path: NodePath = "../../ArtPanelLayer/ArtPanel"
onready var panel = get_node(panel_path)

export var title: String = "Title"
export var content_image: Texture
export(String, MULTILINE) var japanese_description = "日本語説明"
export(String, MULTILINE) var english_description = "English description"
export var video_link: String = ""
export var original_link: String = ""
export var download_link: String = ""
export var source_link: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelTriggerArea.connect("body_entered", panel, "_on_PanelTriggerArea_body_entered", [title, content_image, japanese_description, english_description, video_link, original_link, download_link, source_link])
	$PanelTriggerArea.connect("body_exited", panel, "_on_PanelTriggerArea_body_exited")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
