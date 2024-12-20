class_name Brother
extends CharacterBody2D

@export var min_walk_cycle: int = 2
@export var max_walk_cycle: int = 6

var walk_cycles: int
var current_walk_cycle: int
var called: bool = false

func _ready() -> void:
	walk_cycles = randi_range(min_walk_cycle,max_walk_cycle)
	SignalManager.on_call_pressed.connect(on_call_pressed)

func _on_follow_timer_timeout() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	print(called)


func on_call_pressed() -> void:
	#print_debug("apertou")
	called == true
