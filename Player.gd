extends KinematicBody2D


export var player_speed: Vector2 = Vector2(150, 120)
onready var animationplayer: AnimationPlayer = $RenderPos/Keys/AnimationPlayer
var has_moved: bool = false


func move_player(input_vector: Vector2) -> void:
#	var input_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var player_velocity: Vector2 = player_speed * input_vector
	move_and_slide(player_velocity)
	$RenderPos.global_position = global_position.round() # pixel perfect movement
	
	if not has_moved and player_velocity.length() > 0:
		has_moved = false
		animationplayer.stop()
		$RenderPos/Keys.visible = false
	
	$RenderPos/move_right.visible = false
	$RenderPos/move_left.visible = false
	$RenderPos/move_forward.visible = false
	$RenderPos/idle.visible = false
	if input_vector.x != 0:
		if input_vector.x > 0:
			$RenderPos/move_right.visible = true
		if input_vector.x < 0:
			$RenderPos/move_left.visible = true
	elif input_vector.y != 0:
		if input_vector.y > 0:
			$RenderPos/move_forward.visible = true
		if input_vector.y < 0:
			$RenderPos/move_forward.visible = true
	else:
		$RenderPos/idle.visible = true


func _ready() -> void:
	animationplayer.seek(0, true)
	animationplayer.play("keys")


func _physics_process(delta) -> void:
	var input_vector: Vector2 = Vector2(int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")), int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))).normalized()
	move_player(input_vector)
