extends Area2D

@export var go_to_scene: String



func _on_area_entered(area: Area2D) -> void:
	print_debug("entrou")
	SignalManager.on_scene_change.emit(go_to_scene)