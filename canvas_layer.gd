extends CanvasLayer


func _start():
	$AnimationPlayer.play("end_scene")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	SceneManager.on_scene_change("main_menu")
