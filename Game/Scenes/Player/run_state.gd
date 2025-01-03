extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D



func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	#print(player.player_direction)
	#print(player.looking_down)
	if player.looking_down == false: #andando pra cima
		if player.player_direction.x > 0:
			animated_sprite_2d.play("run_up")
			animated_sprite_2d.flip_h = false
		elif player.player_direction.x < 0 :
			animated_sprite_2d.play("run_up")
			animated_sprite_2d.flip_h = true
		elif  player.player_direction.y < 0 and player.player_direction.x == 0 :
			animated_sprite_2d.play("run_up")
			animated_sprite_2d.flip_h = false
	if player.looking_down == true:
		if player.player_direction.x < 0:
			animated_sprite_2d.play("run_down")
			animated_sprite_2d.flip_h = true
		elif player.player_direction.x > 0:
			animated_sprite_2d.play("run_down")
			animated_sprite_2d.flip_h = false
		elif player.player_direction.y > 0 and player.player_direction.x == 0 :
			animated_sprite_2d.play("run_down")
			animated_sprite_2d.flip_h = false
			
			
	if player.player_direction != Vector2.ZERO:
		player.player_direction = player.player_direction

func _on_next_transitions() -> void:
	if player.hurt == true:
		transition.emit("hurt")
	if player.falling == true:
		transition.emit("falling")
	if !player.is_movement_input():
		transition.emit("idle")


func _on_enter() -> void:
	
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
