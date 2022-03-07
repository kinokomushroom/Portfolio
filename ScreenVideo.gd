extends TextureRect



func _ready():
	pass


func _process(delta):
	var current_viewport_image: Image = get_viewport().get_texture().get_data()
	current_viewport_image.flip_y()
	var current_viewport_texture = ImageTexture.new()
	current_viewport_texture.create_from_image(current_viewport_image, 0)
	texture = current_viewport_texture
