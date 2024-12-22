extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
#@onready var door_sprite: AnimatedSprite2D = $DoorSprite
@onready var door: Sprite2D = $Door


@onready var button: Sprite2D = $Button
@onready var animation_player: AnimationPlayer = $AnimationPlayer



var locked: bool = true
var brother_entered: bool = false

func _ready() -> void:
	locked = true
	#door_sprite.play("locked")
	button.frame = 0
	brother_entered = false
	#collision_shape_2d.call_deferred("disabled", false)
	#collision_shape_2d.disabled = false

func _process(delta: float) -> void:
	#if (brother_entered == true and Input.is_action_just_pressed("interact")) and locked == true:
		#unlock_door()
	pass

	

func unlock_door() -> void:
	locked = false
	button.frame = 1
	#door_sprite.play("open")
	collision_shape_2d.set_deferred("disabled",true)
	#collision_shape_2d.disabled = true
	#collision_shape_2d.call_deferred("disabled") == true# collision_shape_2d.disabled = true
	#collision_shape_2d.call_deferred("disabled", true)
	animation_player.play("open")

func _on_button_area_area_entered(area: Area2D) -> void:
	if locked == true:
		brother_entered = true
		locked = false
		unlock_door()
