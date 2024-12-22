extends CharacterBody2D


@export var min_walk_cycle: int = 2
@export var max_walk_cycle: int = 6
@export var min_speed: float = 20
@export var max_speed: float = 30

var walk_cycles: int
var current_walk_cycle: int

var speed_hunting = 2
var speed = 25
#var min_speed
#var max_speed
var player = null
@export var actived:bool = false
@export var hunting:bool = false
@export var fugindo:bool = false
var brother: CharacterBody2D = null
var target_position 
var target_direction
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var remote_transform_2d: RemoteTransform2D = $RemoteTransform2D

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)
	SignalManager.on_call_pressed.connect(get_brother)
	brother = GameManager.get_player()
	walk_cycles = randi_range(min_walk_cycle,max_walk_cycle)
	call_deferred("character_setup")

func character_setup() -> void:
	await get_tree().physics_frame
	set_movement_target()


func set_movement_target() -> void:
	var target_position: Vector2 = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(),navigation_agent_2d.navigation_layers,false)
	navigation_agent_2d.target_position = target_position
	speed = randf_range(min_speed,max_speed)
	

func _physics_process(delta: float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		current_walk_cycle += 1
		set_movement_target()
	
	
	if hunting == true:
		var dir = brother.global_position - self.global_position
		velocity = dir * speed_hunting
	
	
	if fugindo == true:
		target_position = navigation_agent_2d.get_next_path_position()
		target_direction = global_position.direction_to(target_position)
		velocity = target_direction * speed
	
	move_and_slide()

func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
		velocity = safe_velocity
		move_and_slide()

func get_brother():
	if actived == true and fugindo == false:
		hunting = true
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	area.get_parent().ufo()
	remote_transform_2d.remote_path = area.get_parent().get_path()
	
	hunting = false
	fugindo = true


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	actived = true


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	actived = false


func _on_navigation_agent_2d_navigation_finished() -> void:
	print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
