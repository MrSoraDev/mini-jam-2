extends NodeState

@onready var player_animation: AnimationPlayer = $"../../PlayerAnimation"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("idle_down")
	player_animation.play("hurt")


func _on_exit() -> void:
	pass

func end_hurt() -> void:
	#player_animation.play("RESET")
	animated_sprite_2d.stop()
	transition.emit("idle")
	
