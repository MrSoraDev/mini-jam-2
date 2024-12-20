extends NodeState

@onready var follow_timer: Timer = $"../../FollowTimer"

@export var character: Brother
@export var animated_sprite_2d: AnimatedSprite2D
var player:Player
var player_position: Vector2

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	player_position = player.global_position

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction = character.global_position.direction_to(player.global_position)
	character.velocity = direction * 300
	character.move_and_slide()


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	follow_timer.start()
	
func _on_exit() -> void:
	character.called == false
	transition.emit("idle")


func _on_follow_timer_timeout() -> void:
	_on_exit()
