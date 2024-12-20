extends Node2D

var y_mode = true
var can_change = true

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2

@onready var ray_cast_2d_3: RayCast2D = $RayCast2D3
@onready var ray_cast_2d_4: RayCast2D = $RayCast2D4

var wait_timer = 2.0
@onready var timer: Timer = $Timer


func _process(delta: float) -> void:
	if can_change == false:
		return
	
	if y_mode == true:
		if ray_cast_2d.is_colliding() or ray_cast_2d_2.is_colliding():
			can_change = false
			_ping()
		
	else:
		if ray_cast_2d_3.is_colliding() or ray_cast_2d_4.is_colliding():
			can_change = false
			_ping()
		


func _ping():
	get_parent().change_dir()
	timer.start(wait_timer)


func restart():
	can_change = true


func _on_timer_timeout() -> void:
	restart()
