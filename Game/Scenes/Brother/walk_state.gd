extends NodeState

@export var character: Brother
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigation_agent_2d: NavigationAgent2D
@export var min_speed: float = 50
@export var max_speed: float = 70

#@onready var maker: Node2D = $"../../Brother_marker"

var maker: Node2D = null

var speed: float

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)
	SignalManager.on_brother_hurt.connect(on_brother_hurt)
	call_deferred("character_setup") #vai esperar um pouco antes de começar a fisica do navegation
	
func character_setup() -> void:
	await get_tree().physics_frame
	
	set_movement_target()
	
func set_movement_target() -> void:
	var target_position: Vector2 = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(),navigation_agent_2d.navigation_layers,false)
	maker = GameManager.get_maker()
	maker.set_pos(target_position)
	
	#sprite_2d.global_position = target_position
	#navigation_agent_2d.target_position = sprite_2d.global_position
	navigation_agent_2d.target_position = target_position
	speed = randf_range(min_speed,max_speed)
	
func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		character.current_walk_cycle += 1
		set_movement_target()
		return
	
	var target_position: Vector2 = navigation_agent_2d.get_next_path_position()
	var target_direction: Vector2 = character.global_position.direction_to(target_position)
	var velocity: Vector2 = target_direction * speed
	
	if navigation_agent_2d.avoidance_enabled:
		animated_sprite_2d.flip_h = velocity.x < 0 # é uma conta, vai retornar true ou false se é menor que 0
		navigation_agent_2d.velocity = velocity
	else:
		character.velocity = velocity
		character.move_and_slide()
	
	


func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
	if character.falling == false and character.dead == false and character.abducted == false:
		animated_sprite_2d.flip_h = safe_velocity.x < 0
		character.velocity = safe_velocity
		if character.velocity.y > 0:
			animated_sprite_2d.play("walk_down")
		
		elif character.velocity.y < 0:
			animated_sprite_2d.play("walk_up")
		character.move_and_slide()
		#else: 
			#elif character.velocity.y < 0:
			#animated_sprite_2d.play("walk_up")	
	
func _on_next_transitions() -> void:
	if character.dead == true:
		transition.emit("dead")
	
	if character.abducted == true:
		transition.emit("abducted")
	
	if character.falling == true:
		transition.emit("falling")
	
	if character.current_walk_cycle == character.walk_cycles:
		character.velocity = Vector2.ZERO
		transition.emit("idle")
		
	elif character.called == true:
		transition.emit("return")
	
func on_brother_hurt():
	set_movement_target()
	
func _on_enter() -> void:
	#print_debug("run")
	character.current_walk_cycle = 0

func _on_exit() -> void:
	maker.off_maker()
	animated_sprite_2d.stop()
