extends ColorRect

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_transition.connect(on_transition)


func on_transition() -> void:
	animation_player.play("FadeToBlack")
