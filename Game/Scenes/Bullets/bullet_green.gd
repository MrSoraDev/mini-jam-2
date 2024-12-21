extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var vectordir = Vector2.ZERO
var speed = 160
@onready var ray_cast_2d: RayCast2D = $RayCast2D

func _ready() -> void:
	animation_player.play("rolling")


func _start(vector):
	vectordir = vector

func _physics_process(delta: float) -> void:
	velocity = vectordir * speed
	print(velocity)
	if ray_cast_2d.is_colliding() == true:
		dead()
	
	move_and_slide()


func _on_hurt_box_area_entered(area: Area2D) -> void:
	dead()


func dead():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	dead()
