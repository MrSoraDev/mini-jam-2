extends StaticBody2D

@onready var timer: Timer = $Timer
@export var timing_bullet = 2.0
@export var dir = Vector2.ZERO
const bullet = preload("res://Game/Scenes/Bullets/bullet_green.tscn")
@onready var anim: AnimationPlayer = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(timing_bullet)
	if dir.y == 1:
		anim.play("shoot_up")
	elif dir.y == -1:
		anim.play("shoot_down")
	if dir.x == 1:
		anim.play("shoot_right")
	elif dir.x == -1:
		anim.play("shoot_left")



func _on_timer_timeout() -> void:
	if dir.y == 1:
		anim.play("shoot_up")
	elif dir.y == -1:
		anim.play("shoot_down")
	if dir.x == 1:
		anim.play("shoot_right")
	elif dir.x == -1:
		anim.play("shoot_left")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var inst = bullet.instantiate()
	inst._start(dir)
	inst.global_position = self.global_position
	get_parent().add_child(inst)
	timer.start(timing_bullet)
