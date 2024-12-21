extends Node

const BATSWING = "bat_swing" #preloads
const HEAL = "heal"
const HIT = "hit"
const HURT = "hurt"
const WHISTLE = "whistle"

var SOUNDS: Dictionary = {
	BATSWING: preload("res://Assets/Sound/swing.mp3"), #preloads
	HEAL: preload("res://Assets/Sound/brother_heal.wav"),
	HIT: "hit", #enemey hitted
	HURT: preload("res://Assets/Sound/brother_hurt.wav"),
	WHISTLE : preload("res://Assets/Sound/whistle.mp3")
}

func play_clip(player: AudioStreamPlayer2D, clip_key: String) -> void:
	if SOUNDS.has(clip_key) == false:
		return
	player.stream = SOUNDS[clip_key]
	player.play()
