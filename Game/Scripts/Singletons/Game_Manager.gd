extends Node

var brother_max_health: float = 1000.0
var brother_health: float
var venon_force: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	brother_health = brother_max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	brother_health -= venon_force
		

func get_brother_max_health() -> float:
	return brother_max_health

func get_brother_health() -> float:
	return brother_health

func change_brother_health(amount:float) -> void:
	brother_health += amount
	if brother_health <= 0:
		SignalManager.on_brother_dead.emit()
	elif brother_health >= brother_max_health:
		brother_health = brother_max_health
