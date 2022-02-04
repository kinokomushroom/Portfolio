extends TextureButton


export var link: String = "https://www.youtube.com/"


func _on_ButtonLink_pressed():
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	JavaScript.eval("window.open('" + link + "', '_blank')")
