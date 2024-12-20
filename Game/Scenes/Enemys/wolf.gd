extends CharacterBody2D

var alvo = null
var close = false
@export var speed = 0.5
@export var attack_jump = 2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	if alvo == null:
		return
	var dir = self.global_position - alvo.global_position
	if close == true:
		animation_player.play("attack")
		velocity = (dir * attack_jump) * -1
		move_and_slide()
		await  animation_player.animation_finished
		return
	
	velocity = (dir * speed) * -1
	move_and_slide()


func _on_see_box_area_entered(area: Area2D) -> void:
	alvo = area


func _on_close_box_area_entered(area: Area2D) -> void:
	close = true


func _on_close_box_area_exited(area: Area2D) -> void:
	close = false
