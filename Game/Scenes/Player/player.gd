class_name Player
extends CharacterBody2D

var player_direction:Vector2
var looking_down: bool = true
var has_herb: bool = false

@export var speed = 100
@export var accel = 10
@onready var herb_indicatior: Sprite2D = $HerbIndicatior

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	herb_indicatior.visible = false
	print(global_position)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("call"):
		SignalManager.on_call_pressed.emit()
	
	move()

	
	move_and_slide()
	#print(player_direction)
	#print(is_movement_input())
	
func is_movement_input() -> bool:
	if player_direction == Vector2.ZERO:
		return false
	else:
		return true

func move() -> Vector2:
	player_direction = Input.get_vector("left","right","up","down").normalized()
	velocity.x = move_toward(velocity.x,speed * player_direction.x, accel)
	velocity.y = move_toward(velocity.y,speed * player_direction.y, accel)
	verify_direction()
	return player_direction
	
func verify_direction() -> void:
	if player_direction.y > 0:
		looking_down = true
	elif player_direction.y < 0:
		looking_down = false


func _on_herb_catcher_area_entered(area: Area2D) -> void:
	herb_indicatior.visible = true
	area.queue_free()
	has_herb = true
