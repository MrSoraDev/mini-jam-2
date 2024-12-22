extends Camera2D

@export var shake_amount: float = 5
@export var land_shake: float = 2


@onready var player_timer: Timer = $PlayerTimer
@onready var enemy_timer: Timer = $EnemyTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	SignalManager.on_player_hurt.connect(on_player_hurt)
	
	SignalManager.on_enemy_hurt.connect(on_landing_shake)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	offset = get_random_offset()

func get_random_offset() -> Vector2:
	return Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))

func on_landing_shake() -> void:
	set_process(true)
	shake_amount = land_shake
	enemy_timer.start()
	#return Vector2(randf_range(-land_shake, land_shake), randf_range(-land_shake, land_shake))

func reset_camera() -> void:
	set_process(false)
	offset = Vector2.ZERO

func on_game_over() -> void:
	reset_camera()

func on_player_hurt() -> void:
	set_process(true)
	shake_amount = 5
	player_timer.start()

func _on_shake_timer_timeout() -> void:
	reset_camera()


func _on_land_timer_timeout() -> void:
	reset_camera()
