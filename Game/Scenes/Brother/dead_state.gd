extends NodeState

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var brother: Brother = $"../.."

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("die")
	brother.dead = true
	SignalManager.on_hud_game_over.emit()

func _on_exit() -> void:
	pass
