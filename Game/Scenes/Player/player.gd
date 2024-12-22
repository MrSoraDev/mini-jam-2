class_name Player
extends CharacterBody2D

var player_direction:Vector2
var looking_down: bool = true
var has_herb: bool = false
var defending: bool = false

var invencible: bool = false
var hurt: bool = false
var can_whistle: bool = true
@export var falling: = false

@export var speed = 100
@export var accel = 10
@onready var whistle_timer: Timer = $WhistleTimer

@onready var herb_indicatior: Sprite2D = $HerbIndicatior
@onready var bat: Sprite2D = $BatNode/Bat
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound: AudioStreamPlayer2D = $Sound
@onready var stun: AnimatedSprite2D = $Stun



func _ready() -> void:
	herb_indicatior.visible = false
	GameManager.set_player_jogavel(self)
	stun.hide()

func _process(delta: float) -> void:
	pass
		

func _physics_process(delta: float) -> void:
	print_debug(hurt)
	if Input.is_action_just_pressed("call") and can_whistle == true:
		SoundManager.play_clip(sound, SoundManager.WHISTLE)
		SignalManager.on_call_pressed.emit()
		can_whistle = false
		whistle_timer.start()
	if hurt == true:
		stun.show()
	else:
		stun.hide()
	move()
	#print(falling)
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
	check_defending()
	player_direction = Input.get_vector("left","right","up","down").normalized()
	if falling == false and hurt == false:
		velocity.x = move_toward(velocity.x,speed * player_direction.x, accel)
		velocity.y = move_toward(velocity.y,speed * player_direction.y, accel)
	else:
		velocity.x = 0
		velocity.y = 0
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

func have_herb() -> bool:
	return has_herb

func herb_delivered() -> void:
	has_herb = false
	herb_indicatior.visible = false

func swing_bat() -> void:
	SoundManager.play_clip(sound, SoundManager.BATSWING)

func stop_defending() -> void:
	defending = false


func _on_hurt_box_area_entered(area: Area2D) -> void:
	
	if invencible == false:
		SignalManager.on_player_hurt.emit()
		SoundManager.play_clip(sound, SoundManager.HURT)
		hurt = true
		invencible = true

func check_defending()->void:
	if defending == false:
		speed = 100
	else: 
		speed = 50
func _on_whistle_timer_timeout() -> void:
	can_whistle = true
