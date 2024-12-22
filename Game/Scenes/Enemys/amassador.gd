extends CharacterBody2D

@export var move_wait_timer: float = 4.0
@export var start_timer: float = 2.5
@export var speed  = 200
@export var y_dir:bool = false
@onready var timer: Timer = $Timer
@onready var raycasts: Node2D = $Raycasts
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var icon: Sprite2D = $Icon


var move: bool = false
var dir = 1


func _physics_process(delta: float) -> void:
	if move == false:
		velocity = Vector2.ZERO
		return
	
	
	if y_dir == true:
		velocity.y = speed * dir
	else:
		velocity.x = speed * dir
	
	move_and_slide()


func change_dir():
	move = false
	animation_player.play("stomp_end")
	timer.start(move_wait_timer)
	dir = dir * -1
	icon.scale.y = 4 * dir
	if dir == 1:
		icon.position.y = -7
	else:
		icon.position.y = 7


func _ready() -> void:
	timer.start(start_timer)
	raycasts.y_mode = y_dir
	raycasts.wait_timer = move_wait_timer + 0.5
	if speed < 0:
		icon.flip_v = true
func _on_timer_timeout() -> void:
	animation_player.play("stomp_start")
	await animation_player.animation_finished
	animation_player.play("stomp_mid")
	move = true
