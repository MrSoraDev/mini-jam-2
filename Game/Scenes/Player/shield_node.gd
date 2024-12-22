extends Node2D

@onready var shield: Sprite2D = $Shield

@onready var shield_animation: AnimationPlayer = $ShieldAnimation
@onready var player: Player = $".."
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shield.hide()
	collision_shape_2d.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cursor_position = get_global_mouse_position()
	var rotation_angle = global_position.angle_to_point(cursor_position)
	
	#if player.defending == true:
		#shield.show()
	#else:
		#shield.hide()
	#print(rotation_angle)
	rotation = rotation_angle
	
	if Input.is_action_just_released("defend"):
		shield.hide()
		collision_shape_2d.disabled = true
		shield_animation.stop()
		shield.hide()
		player.stop_defending()
	
	if Input.is_action_just_pressed("defend"):
		shield_animation.play("defend")
		collision_shape_2d.disabled = false
		shield.show()
		player.defending = true
		#shield.show()
		#bat_animation.play("hit")
