extends Node2D


export var shaded_color: Color
export var lit_color: Color


func _ready():
	$Light.visible = false
	self.modulate = shaded_color


# triggered when player gets within range
# turn on spotlight
func _on_EventTriggerArea_body_entered(body):
	$Light.visible = true
	self.modulate = lit_color


# triggered when player exits range
# turn off spotlight
func _on_EventTriggerArea_body_exited(body):
	$Light.visible = false
	self.modulate = shaded_color
