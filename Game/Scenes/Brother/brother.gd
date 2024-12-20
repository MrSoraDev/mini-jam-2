class_name Brother
extends CharacterBody2D

@export var min_walk_cycle: int = 2
@export var max_walk_cycle: int = 6

var walk_cycles: int
var current_walk_cycle: int
var called: bool = false
var health: int

func _ready() -> void:
	walk_cycles = randi_range(min_walk_cycle,max_walk_cycle)
	SignalManager.on_call_pressed.connect(on_call_pressed)
	health = GameManager.get_brother_health() #pq ja vai estar como max no game manager
	
func _on_follow_timer_timeout() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass


func on_call_pressed() -> void:
	#print_debug("apertou")
	called = true


func _on_navigation_agent_2d_navigation_finished() -> void:
	print_debug("terminou navegaçao, mudar local")
