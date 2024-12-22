extends Node2D

@onready var bat_animation: AnimationPlayer = $BatAnimation
@onready var bat: Sprite2D = $Bat
@onready var player: Player = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var slash: Sprite2D = $Slash

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cursor_position = get_global_mouse_position()
	var rotation_angle = global_position.angle_to_point(cursor_position)
	if rotation_angle < 1.5 and rotation_angle > -1.5:
		#slash.flip_h = false
		animated_sprite_2d.flip_h = false
		bat.flip_v = false
	else: 
		#slash.flip_h = true
		animated_sprite_2d.flip_h = true
		bat.flip_v = true
		
	#print(rotation_angle)
	rotation = rotation_angle
	
	if player.defending == true:
		#print_debug("aoi")
		bat.hide()
	else:
		bat.show()
		
	if Input.is_action_just_pressed("attack") and player.defending == false:
		bat_animation.play("hit")
