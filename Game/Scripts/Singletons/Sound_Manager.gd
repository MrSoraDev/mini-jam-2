extends Node

const BATSWING = "bat_swing" #preloads
const HEAL = "heal"
const HIT = "hit"

var SOUNDS: Dictionary = {
	BatSwing = "bat_swing", #preloads
	HEAL = "heal",
	HIT = "hit"
}

func play_clip(player: AudioStreamPlayer2D, clip_key: String) -> void:
	if SOUNDS.has(clip_key) == false:
		return
	player.stream = SOUNDS[clip_key]
	player.play()
