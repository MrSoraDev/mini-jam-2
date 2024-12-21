extends NodeState

@export var player: Player
var setup_position: Vector2
@onready var player_animation: AnimationPlayer = $"../../PlayerAnimation"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var falling_timer: Timer = $FallingTimer

func _ready() -> void:
	SignalManager.on_falling_end.connect(on_falling_end)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	player.player_direction = Vector2.ZERO


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("falling") #girando
	player_animation.play("shinking") #diminuindo
	falling_timer.start()

func _on_exit() -> void:
	animated_sprite_2d.stop()
	player.global_position = setup_position

func end_fall() -> void:
	transition.emit("hurt")
	
func on_falling_end(pos:Vector2): 
	setup_position = pos
	
func _on_falling_timer_timeout() -> void:
	player.falling = false
	end_fall()
