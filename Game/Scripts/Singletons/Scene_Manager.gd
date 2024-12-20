extends Node

var Scenes: Dictionary = {
	"fase1": preload("res://Game/Scenes/Test/test_scene_sora.tscn")
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_scene_change.connect(on_scene_change)


func on_scene_change(scene_name:String):
	if Scenes.has(scene_name) == false:
		return
	get_tree().change_scene_to_packed(Scenes[scene_name])
	
