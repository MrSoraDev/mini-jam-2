extends NodeState

@onready var player_animation: AnimationPlayer = $"../../PlayerAnimation"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var hurt_timer: Timer = $HurtTimer
@onready var player: Player = $"../.."

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	#animated_sprite_2d.play("idle_down")
	player_animation.play("hurt")#piscar
	hurt_timer.start()
	


func _on_exit() -> void:
	#animated_sprite_2d.stop()
	pass


func _on_hurt_timer_timeout() -> void:
	#player_animation.play("RESET")
	transition.emit("idle")
	player.hurt = false
	player.invencible = false
