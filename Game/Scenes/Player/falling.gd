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
	animated_sprite_2d.play("falling") #girando
	player_animation.play("falling") #diminuindo


func _on_exit() -> void:
	pass

func end_fall() -> void:
	transition.emit("hurt")
	animated_sprite_2d.stop()
