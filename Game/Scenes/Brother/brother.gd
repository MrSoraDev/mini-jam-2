class_name Brother
extends CharacterBody2D

@export var min_walk_cycle: int = 2
@export var max_walk_cycle: int = 6
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var hurt_box: Area2D = $HurtBox
@onready var hurt_timer: Timer = $HurtTimer
@onready var animations: AnimationPlayer = $HurtAnimation
@onready var sound: AudioStreamPlayer2D = $Sound


var walk_cycles: int
var current_walk_cycle: int
var called: bool = false
var health: int
var invencible: bool = false


func _ready() -> void:
	GameManager.set_player(self)
	walk_cycles = randi_range(min_walk_cycle,max_walk_cycle)
	SignalManager.on_call_pressed.connect(on_call_pressed)
	SignalManager.on_brother_dead.connect(on_brother_dead)
	health = GameManager.get_brother_health() #pq ja vai estar como max no game manager
	progress_bar.max_value = GameManager.get_brother_max_health()
	progress_bar.value = GameManager.get_brother_health()
	
	

func _process(delta: float) -> void:
	progress_bar.value = GameManager.get_brother_health()


func on_call_pressed() -> void:
	#print_debug("apertou")
	called = true

func _on_navigation_agent_2d_navigation_finished() -> void:
	print_debug("terminou navegaçao, mudar local")


func _on_hurt_timer_timeout() -> void:
	invencible = false

func on_brother_dead() -> void:
	queue_free()


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if invencible == false:
		GameManager.change_brother_health(-50.0)
		invencible == true
		hurt_timer.start()
		animations.play("hurt")
		SoundManager.play_clip(sound, SoundManager.HURT)
	else:
		return


func _on_player_dectection_area_entered(area: Area2D) -> void:
	if area.get_parent().have_herb():
		GameManager.change_brother_health(200.0)
		animations.play("heal")
		area.get_parent().herb_delivered()
		SoundManager.play_clip(sound, SoundManager.HEAL)
