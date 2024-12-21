extends Area2D

@onready var sign_sprite: Sprite2D = $SignSprite
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	label.show()
	

func _on_area_exited(area: Area2D) -> void:
	label.hide()
