extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_hud_game_over.connect(on_hud_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	SceneManager.on_scene_change("main_menu")

func on_hud_game_over() -> void:
	show()
	var moveables = get_tree().get_nodes_in_group("moveables")
	for moveable in moveables:
		moveable.set_physics_process(false)
