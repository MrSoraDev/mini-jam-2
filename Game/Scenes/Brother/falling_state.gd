extends NodeState


@onready var brother: Brother = $"../.."

var setup_position: Vector2
@onready var brother_animation: AnimationPlayer = $"../../BrotherAnimation"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var falling_timer: Timer = $FallingTimer




func _ready() -> void:
	SignalManager.on_falling_end.connect(on_falling_end)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass
	#player.player_direction = Vector2.ZERO


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("falling") #girando
	brother_animation.play("shinking") #diminuindo
	GameManager.change_brother_health(-200)
	falling_timer.start()

func _on_exit() -> void:
	animated_sprite_2d.stop()
	brother.global_position = setup_position

func end_fall() -> void:
	transition.emit("idle")
	
func on_falling_end(pos:Vector2): 
	setup_position = pos
	
func _on_falling_timer_timeout() -> void:
	brother.falling = false
	brother_animation.play("RESET")
	end_fall()
