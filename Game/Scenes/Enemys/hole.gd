extends Area2D

@onready var sound: AudioStreamPlayer2D = $Sound
@export var maker: Marker2D = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	
	area.get_parent().falling = true
	SignalManager.on_falling_end.emit(maker.global_position)
	SoundManager.play_clip(sound, SoundManager.FALL)
