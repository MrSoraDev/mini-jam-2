extends Area2D
@onready var end_layer: CanvasLayer = $"../End_layer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	print("try")
	end_layer._start()
