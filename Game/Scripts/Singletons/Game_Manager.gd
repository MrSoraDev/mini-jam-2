extends Node

var brother_max_health: int = 100
var brother_health: int
var venon_force: int = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	brother_health = brother_max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	brother_health -= venon_force
	pass

func get_brother_max_health() -> int:
	return brother_max_health

func get_brother_health() -> int:
	return brother_max_health

func change_brother_health(amount:int) -> void:
	brother_health += amount
	if brother_health <= 0:
		SignalManager.on_brother_dead.emit()
	elif brother_health >= brother_max_health:
		brother_health = brother_max_health
