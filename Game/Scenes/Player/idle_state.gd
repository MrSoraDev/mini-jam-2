extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if player.looking_down == true:
		animated_sprite_2d.play("idle_down")
	elif player.looking_down == false:
		animated_sprite_2d.play("idle_up")
	#if player.player_direction == Vector2.UP:
		#animated_sprite_2d.play("idle_up")
	#elif player.player_direction == Vector2.DOWN:
		#animated_sprite_2d.play("idle_down")

func _on_next_transitions() -> void:
	if player.falling == true:
		transition.emit("falling")
	if player.is_movement_input():
		transition.emit("Run")
	


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
