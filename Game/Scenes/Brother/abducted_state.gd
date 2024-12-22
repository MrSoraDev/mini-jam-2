extends NodeState

@onready var brother: Brother = $"../.."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if brother.abducted == false:
		transition.emit("idle")


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("idle_down")
	brother.abducted = true

func _on_exit() -> void:
	pass
