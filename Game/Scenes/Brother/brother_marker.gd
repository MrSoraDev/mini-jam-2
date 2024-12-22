extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("pulsar")
	GameManager.set_maker(self)
	off_maker()

func on_maker():
	sprite_2d.visible = true


func off_maker():
	sprite_2d.visible = false


func set_pos(pos):
	sprite_2d.global_position = pos
	on_maker()
