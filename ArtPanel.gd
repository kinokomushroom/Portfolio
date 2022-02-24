extends Control


onready var tween: Tween = $Tween
export var fade_duration: float = 0.2

onready var description_english: RichTextLabel = $Panel/DescriptionContainer/DescriptionEnglish
onready var description_japanese: RichTextLabel = $Panel/DescriptionContainer/DescriptionJapanese


func update_text_language():
	description_english.visible = !Global.is_current_japanese
	description_japanese.visible = Global.is_current_japanese
	$Panel/ButtonJapan.pressed = Global.is_current_japanese
	$Panel/ButtonEnglish.pressed = !Global.is_current_japanese


func show_panel():
	description_english.scroll_to_line(0)
	description_japanese.scroll_to_line(0)
	visible = true
	tween.interpolate_property(self, "modulate", Color.transparent, Color.white, fade_duration, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()


func hide_panel():
	tween.interpolate_property(self, "modulate", Color.white, Color.transparent, fade_duration, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_completed")
	visible = false


func _ready():
	update_text_language()
	visible = false


# change language to English
func _on_ButtonEnglish_toggled(button_pressed: bool):
	Global.is_current_japanese = !button_pressed
	update_text_language()


# change language to Japanese
func _on_ButtonJapan_toggled(button_pressed: bool):
	Global.is_current_japanese = button_pressed
	update_text_language()


# close panel
func _on_ButtonCancel_pressed():
	hide_panel()


func _on_PanelTriggerArea_body_entered(body: KinematicBody2D, title: String, content_image: Texture, japanese_description: String, english_description: String, tools_used: String, video_link: String, original_link: String, download_link: String, source_link: String):
	update_text_language()
	$Panel/Title.text = title
	$Panel/ContentContainer/ContentCenter/ContentImage.texture = content_image
	$Panel/DescriptionContainer/DescriptionJapanese.text = japanese_description + "\n\n" + "使用ツール：\n" + tools_used
	$Panel/DescriptionContainer/DescriptionEnglish.text = english_description + "\n\n" + "Tools used:\n" + tools_used
	
	if video_link != "":
		$Panel/ButtonContainer/ButtonVideo.visible = true
		$Panel/ButtonContainer/ButtonVideo.link = video_link
	else:
		$Panel/ButtonContainer/ButtonVideo.visible = false
	
	if original_link != "":
		$Panel/ButtonContainer/ButtonHD.visible = true
		$Panel/ButtonContainer/ButtonHD.link = original_link
	else:
		$Panel/ButtonContainer/ButtonHD.visible = false
	
	if download_link != "":
		$Panel/ButtonContainer/ButtonDownload.visible = true
		$Panel/ButtonContainer/ButtonDownload.link = download_link
	else:
		$Panel/ButtonContainer/ButtonDownload.visible = false
	
	if source_link != "":
		$Panel/ButtonContainer/ButtonSource.visible = true
		$Panel/ButtonContainer/ButtonSource.link = source_link
	else:
		$Panel/ButtonContainer/ButtonSource.visible = false
	
	show_panel()


func _on_PanelTriggerArea_body_exited(body: KinematicBody2D):
	hide_panel()


