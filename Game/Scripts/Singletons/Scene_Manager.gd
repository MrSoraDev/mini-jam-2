extends Node

var Scenes: Dictionary = {
	"world1": preload("res://Game/Scenes/world/world_01.tscn"),
	"world2": preload("res://Game/Scenes/world/world_02.tscn"),
	"world3": preload("res://Game/Scenes/world/world_03.tscn"),
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_scene_change.connect(on_scene_change)


func on_scene_change(scene_name:String):
	if Scenes.has(scene_name) == false:
		return
	get_tree().change_scene_to_packed(Scenes[scene_name])
	
