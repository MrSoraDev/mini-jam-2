class_name Player
extends CharacterBody2D

var player_direction:Vector2
@export var speed = 100
@export var accel = 10

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("call"):
		SignalManager.on_call_pressed.emit()
	
	
	
	player_direction = Input.get_vector("left","right","up","down")
	velocity.x = move_toward(velocity.x,speed * player_direction.x, accel)
	velocity.y = move_toward(velocity.y,speed * player_direction.y, accel)
	
	move_and_slide()
	#print(player_direction)
	#print(is_movement_input())
	
func is_movement_input() -> bool:
	if player_direction == Vector2.ZERO:
		return false
	else:
		return true
