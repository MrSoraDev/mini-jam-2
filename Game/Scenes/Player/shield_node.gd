extends Node2D

@onready var shield: Sprite2D = $Shield

@onready var shield_animation: AnimationPlayer = $ShieldAnimation
@onready var player: Player = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shield.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cursor_position = get_global_mouse_position()
	var rotation_angle = global_position.angle_to_point(cursor_position)
	
	if player.defending == true:
		shield.show()
	else:
		shield.hide()
	#print(rotation_angle)
	rotation = rotation_angle
	
	if Input.is_action_just_pressed("defend"):
		shield_animation.play("defend")
		player.defending == true
		#bat_animation.play("hit")
