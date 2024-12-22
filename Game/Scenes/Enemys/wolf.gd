extends CharacterBody2D

var alvo = null
var close = false
var up : bool = false
var push = false
var damage_push = false
var alvo_damage = null
var stun = false
var damage = 3

@export var speed = 0.5
@export var attack_jump = 2
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var icon: Sprite2D = $Icon
@onready var timer: Timer = $Timer
var stun_timer = 0.5
@onready var sound: AudioStreamPlayer2D = $Sound

func _ready() -> void:
	animation_player.play("idle_up")

func _physics_process(delta: float) -> void:
	if damage <= 0:
		dead()
	
	if damage_push == true:
		var dir = self.global_position + alvo_damage.global_position
		velocity = (dir * attack_jump * 2) * 1
		move_and_slide()
		await get_tree().create_timer(0.4).timeout
		damage_push = false
		push = false
		stun = true
		timer.start(stun_timer)
		return
	
	if stun == true:
		velocity = Vector2.ZERO
		return
	
	if alvo == null:
		return
	var dir = self.global_position - alvo.global_position
	
	if push == true:
		velocity = (dir * attack_jump) * 1
		move_and_slide()
		await get_tree().create_timer(0.4).timeout
		push = false
		stun = true
		timer.start(stun_timer)
		return
	
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

func dead():
	queue_free()
func _on_see_box_area_entered(area: Area2D) -> void:
	alvo = area


func _on_close_box_area_entered(area: Area2D) -> void:
	close = true


func _on_close_box_area_exited(area: Area2D) -> void:
	close = false


func _on_hit_box_area_entered(area: Area2D) -> void:
	push = true


func _on_timer_timeout() -> void:
	stun = false


func _on_hurt_box_area_entered(area: Area2D) -> void:
	SoundManager.play_clip(sound, SoundManager.ENEMY_HURT)
	SignalManager.on_enemy_hurt.emit()
	animation_player.play("HIT")
	damage = damage - 1
	push = true
	alvo = area.get_parent()
	alvo_damage = area.get_parent()


func _on_hole_box_area_entered(area: Area2D) -> void:
	dead()
