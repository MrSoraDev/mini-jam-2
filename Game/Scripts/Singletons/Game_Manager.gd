extends Node

var brother_marker:Node2D = null
var player: CharacterBody2D = null
var brother = null
var brother_max_health: float = 1000.0
var brother_health: float
var venon_force: float = 0.1
var whistle_cd = 20
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	brother_health = brother_max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if brother_health<=0:
		#brother_health = 0
	#else:
		#brother_health -= venon_force


func get_brother_max_health() -> float:
	return brother_max_health


func get_brother_health() -> float:
	return brother_health

func save_brother_health(health_atual:float):
	brother_health = health_atual
	
	
#func change_brother_health(amount:float) -> void:
	#brother_health += amount
	#if brother_health <= 0:
		#SignalManager.on_brother_dead.emit()
	#elif brother_health >= brother_max_health:
		#brother_health = brother_max_health


func set_maker(node):
	brother_marker = node


func get_maker():
	return brother_marker


func set_player_jogavel(_player):
	player = _player


func get_player_jogavel():
	return player


func set_player(_player):
	brother = _player


func get_player():
	return brother
