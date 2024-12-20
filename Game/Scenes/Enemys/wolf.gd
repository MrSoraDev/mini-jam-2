extends CharacterBody2D

var alvo = null
var close = false
var up : bool = false
@export var speed = 0.5
@export var attack_jump = 2
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var icon: Sprite2D = $Icon

func _physics_process(delta: float) -> void:
	if alvo == null:
		return
	var dir = self.global_position - alvo.global_position
	if close == true:
		handle_anim_attack()
		velocity = (dir * attack_jump) * -1
		move_and_slide()
		await  animation_player.animation_finished
		return
	
	if velocity != Vector2.ZERO:
		handle_anim_walking()
	else:
		handle_anim_idle()
	
	if velocity.y > 1:
		up = true
	elif velocity.y < 1:
		up = false
	
	if velocity.x > 1:
		icon.flip_h = false
	elif velocity.x < -1:
		icon.flip_h = true
	
	velocity = (dir * speed) * -1
	move_and_slide()


func handle_anim_idle():
	if up == true:
		animation_player.play("idle_up")
	else:
		animation_player.play("idle_down")

func handle_anim_attack():
	if up == true:
		animation_player.play("attack_up")
	else:
		animation_player.play("attack_down")

func handle_anim_walking():
	if up == true:
		animation_player.play("walking_up")
	else:
		animation_player.play("walking_down")


func _on_see_box_area_entered(area: Area2D) -> void:
	alvo = area


func _on_close_box_area_entered(area: Area2D) -> void:
	close = true


func _on_close_box_area_exited(area: Area2D) -> void:
	close = false


func _on_hit_box_area_entered(area: Area2D) -> void:
	print("dano")
