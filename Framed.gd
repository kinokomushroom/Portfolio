extends Node2D




func _ready():
	$Light.visible = false 


# triggered when player gets within range
# turn on spotlight
func _on_EventTriggerArea_body_entered(body):
	$Light.visible = true


# triggered when player exits range
# turn off spotlight
func _on_EventTriggerArea_body_exited(body):
	$Light.visible = false
