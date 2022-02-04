extends Control


var is_current_japanese = true


func update_text_language():
	$Panel/DescriptionContainer/DescriptionEnglish.visible = !is_current_japanese
	$Panel/DescriptionContainer/DescriptionJapanese.visible = is_current_japanese
	$Panel/ButtonJapan.pressed = is_current_japanese
	$Panel/ButtonEnglish.pressed = !is_current_japanese

# Called when the node enters the scene tree for the first time.
func _ready():
	update_text_language()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonEnglish_toggled(button_pressed):
	is_current_japanese = !button_pressed
	update_text_language()


func _on_ButtonJapan_toggled(button_pressed):
	is_current_japanese = button_pressed
	update_text_language()
