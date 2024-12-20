extends CharacterBody2D

@export var move_wait_timer: float = 1.0
@export var start_timer: float = 0.5
@export var speed  = 200
@export var y_dir:bool = false
@onready var timer: Timer = $Timer
@onready var raycasts: Node2D = $Raycasts


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
	timer.start(move_wait_timer)
	dir = dir * -1


func _ready() -> void:
	timer.start(start_timer)
	raycasts.y_mode = y_dir
	raycasts.wait_timer = move_wait_timer + 0.5

func _on_timer_timeout() -> void:
	move = true
