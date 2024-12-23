extends Control

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.reset_health()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	SignalManager.on_scene_change.emit("world1")
	
	

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:
	animation_player.play("fly")


func _on_start_timer_timeout() -> void:
	timer.start()
	animation_player.play("fly")


func _on_enter_game_timeout() -> void:
	pass
	#SoundManager.play_clip(sound, SoundManager.MENU_SELECT)
