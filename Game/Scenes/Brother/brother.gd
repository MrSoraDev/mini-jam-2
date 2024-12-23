class_name Brother
extends CharacterBody2D

@export var min_walk_cycle: int = 2
@export var max_walk_cycle: int = 6
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var hurt_box: Area2D = $HurtBox
@onready var hurt_timer: Timer = $HurtTimer
@onready var animations: AnimationPlayer = $HurtAnimation
@onready var sound: AudioStreamPlayer2D = $Sound

@export var abducted:bool = false
var walk_cycles: int
var current_walk_cycle: int
var called: bool = false
var health: float
var invencible: bool = false
var falling: bool = false
var dead: bool = false
var health_atual: float
var venon_force: float = 0.1

func _ready() -> void:
	GameManager.set_player(self)
	walk_cycles = randi_range(min_walk_cycle,max_walk_cycle)
	SignalManager.on_call_pressed.connect(on_call_pressed)
	SignalManager.on_brother_dead.connect(on_brother_dead)
	SignalManager.change_brother_health.connect(change_brother_health)
	health_atual = GameManager.get_brother_health()
	SignalManager.on_scene_change.connect(save_brother_health)
	#health = GameManager.get_brother_health() #pq ja vai estar como max no game manager
	progress_bar.max_value = GameManager.get_brother_max_health()
	progress_bar.value = GameManager.get_brother_health()
	
	

func _process(delta: float) -> void:
	pass
	#if health_atual <=0 :#
		#health_atual = 0#
		#dead = true
	#else:#
		#health_atual -= venon_force#
	#
	##health_atual = GameManager.get_brother_health()
	#progress_bar.value = health_atual

		
	
	#progress_bar.value = GameManager.get_brother_health()

func _physics_process(delta: float) -> void:
	if health_atual <=0 :#
		health_atual = 0#
		dead = true
	else:#
		health_atual -= venon_force#
	
	#health_atual = GameManager.get_brother_health()
	progress_bar.value = health_atual

func change_brother_health(amount:float) -> void:
	health_atual += amount
	if health_atual <= 0:
		on_brother_dead()
		#SignalManager.on_brother_dead.emit()
	elif health_atual >= GameManager.brother_max_health:
		health_atual = GameManager.brother_max_health

func on_call_pressed() -> void:
	called = true

func _on_navigation_agent_2d_navigation_finished() -> void:
	print_debug("terminou navegaçao, mudar local")


func _on_hurt_timer_timeout() -> void:
	invencible = false

func on_brother_dead() -> void:
	dead = true


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if invencible == false:
		#GameManager.change_brother_health(-50.0)
		change_brother_health(-50.0)
		SignalManager.on_brother_hurt.emit()
		invencible = true
		hurt_timer.start()
		animations.play("hurt")
		SoundManager.play_clip(sound, SoundManager.HURT)
	else:
		return


func _on_player_dectection_area_entered(area: Area2D) -> void:
	if area.get_parent().have_herb():
		change_brother_health(200.0)
		
		#GameManager.change_brother_health(200.0)
		animations.play("heal")
		area.get_parent().herb_delivered()
		SoundManager.play_clip(sound, SoundManager.HEAL)

func save_brother_health(ignora:String):
	GameManager.save_brother_health(health_atual)
	#SignalManager.save_brother_health.emit(health_atual)

func free_ufo() -> void:
	abducted = false
	
func ufo() -> void:
	abducted = true
