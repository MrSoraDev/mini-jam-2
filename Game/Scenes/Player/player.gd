class_name Player
extends CharacterBody2D

var player_direction:Vector2
var looking_down: bool = true
var has_herb: bool = false
@export var falling: = false

@export var speed = 100
@export var accel = 10

@onready var herb_indicatior: Sprite2D = $HerbIndicatior
@onready var bat: Sprite2D = $BatNode/Bat
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound: AudioStreamPlayer2D = $Sound

func _ready() -> void:
	herb_indicatior.visible = false

func _process(delta: float) -> void:
	if falling == true:
		set_physics_process(false)
	else:
		set_physics_process(true)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("call"):
		SignalManager.on_call_pressed.emit()

	move()
	print(falling)
	bat.look_at(get_global_mouse_position())
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
	if area.collision_layer == 13:
		print_debug("buraco")
	herb_indicatior.visible = true
	area.queue_free()
	has_herb = true

func have_herb() -> bool:
	return has_herb

func herb_delivered() -> void:
	has_herb = false
	herb_indicatior.visible = false

func swing_bat() -> void:
	SoundManager.play_clip(sound, SoundManager.BATSWING)
