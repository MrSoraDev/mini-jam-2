extends StaticBody2D

@onready var timer: Timer = $Timer
@export var timing_bullet = 2.0
@export var dir = Vector2.ZERO
const bullet = preload("res://Game/Scenes/Bullets/bullet_yellow.tscn")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var actived = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()

func _process(delta: float) -> void:
	if actived == false:
		timer.stop()
		return
	
	if timer.paused == true:
		timer.start(timing_bullet)
func _on_timer_timeout() -> void:
	animation_player.play("shoot")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var inst = bullet.instantiate()
	var player = GameManager.get_player()
	dir = self.global_position - player.global_position
	inst._start(dir)
	inst.global_position = self.global_position
	get_parent().add_child(inst)
	timer.start(timing_bullet)
