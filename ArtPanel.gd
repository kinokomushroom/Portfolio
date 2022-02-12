extends Control


func update_text_language():
	$Panel/DescriptionContainer/DescriptionEnglish.visible = !Global.is_current_japanese
	$Panel/DescriptionContainer/DescriptionJapanese.visible = Global.is_current_japanese
	$Panel/ButtonJapan.pressed = Global.is_current_japanese
	$Panel/ButtonEnglish.pressed = !Global.is_current_japanese


func _ready():
	update_text_language()
	visible = false


func _on_ButtonEnglish_toggled(button_pressed: bool):
	Global.is_current_japanese = !button_pressed
	update_text_language()


func _on_ButtonJapan_toggled(button_pressed: bool):
	Global.is_current_japanese = button_pressed
	update_text_language()


func _on_PanelTriggerArea_body_entered(body: KinematicBody2D, title: String, content_image: Texture, japanese_description: String, english_description: String, video_link: String, original_link: String, download_link: String, source_link: String):
	update_text_language()
	$Panel/Title.text = title
	$Panel/ContentContainer/ContentCenter/ContentImage.texture = content_image
	$Panel/DescriptionContainer/DescriptionJapanese.text = japanese_description
	$Panel/DescriptionContainer/DescriptionEnglish.text = english_description
	
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
	
	visible = true


func _on_PanelTriggerArea_body_exited(body: KinematicBody2D):
	visible = false
