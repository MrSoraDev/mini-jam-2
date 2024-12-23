extends Area2D

@onready var panel: Panel = $Panel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Panel/Label
@export_multiline var texto: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel.hide()
	label.text = texto

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	animation_player.play("begin")
	
	

func _on_area_exited(area: Area2D) -> void:
	animation_player.play("end")
	#panel.hide()
