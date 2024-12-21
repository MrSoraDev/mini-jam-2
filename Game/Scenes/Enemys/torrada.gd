extends StaticBody2D

var fall: bool = false
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	if fall == true:
		return
	
	if ray_cast_2d.is_colliding() == true or ray_cast_2d_2.is_colliding() == true:
		fall = true
		animation_player.play("fall")
