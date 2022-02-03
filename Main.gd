extends Node2D


export var player_speed: float = 200
onready var player: KinematicBody2D = $Player


func move_player() -> void:
	var input_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var player_velocity: Vector2 = player_speed * input_vector
	player.move_and_slide(player_velocity)
	player.position = player.position.round() # pixel perfect movement


func _ready() -> void:
	pass


func _physics_process(delta) -> void:
	move_player()
