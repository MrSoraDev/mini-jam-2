extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var pos_atual = null


func _ready() -> void:
	animation_player.play("pulsar")
	GameManager.set_maker(self)
	off_maker()

func _process(delta: float) -> void:
	if pos_atual != null:
		sprite_2d.global_position  = pos_atual


func on_maker():
	sprite_2d.visible = true


func off_maker():
	sprite_2d.visible = false


func set_pos(pos):
	pos_atual = pos
	sprite_2d.global_position 
	on_maker()
