extends Node2D

@onready var bat_animation: AnimationPlayer = $BatAnimation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cursor_position = get_global_mouse_position()
	var rotation_angle = global_position.angle_to_point(cursor_position)
	rotation = rotation_angle
	if Input.is_action_just_pressed("attack"):
		bat_animation.play("hit")
