extends TextureProgressBar

var player:Player
var seconds: int
var conta: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = GameManager.whistle_cd
	player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	seconds = player.return_whistle_timer()
	conta = abs(seconds - 20)
	if conta == 20:
		tint_progress = ("00b6ca")
		value = 20
	elif conta != 0:
		tint_progress = ("63cc00")
		value = conta
	#value = abs(seconds - 20)
	#print_debug(conta)
