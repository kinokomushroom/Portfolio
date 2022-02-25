extends Viewport


export var player_path: NodePath = ""
onready var player: KinematicBody2D = get_node(player_path)

export var star_1_speed: float = 0.0
export var star_2_speed: float = 0.08
export var star_3_speed: float = 0.2


func _ready():
	pass


func _process(delta):
	$Layer1.position = -player.get_node("RenderPos").global_position * star_1_speed
	$Layer2.position = -player.get_node("RenderPos").global_position * star_2_speed
	$Layer3.position = -player.get_node("RenderPos").global_position * star_3_speed
