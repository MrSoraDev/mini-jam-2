extends Node

const BATSWING = "bat_swing" #preloads
const HEAL = "heal"
const HIT = "hit"
const HURT = "hurt"
const WHISTLE = "whistle"
const FALL = "fall"
const GAME_OVER = "game_over"
const ENEMY_HURT = "enemy_hurt"
const MENU_SELECT = "menu_select"

var SOUNDS: Dictionary = {
	BATSWING: preload("res://Assets/Sound/swing.mp3"), #preloads
	HEAL: preload("res://Assets/Sound/brother_heal.wav"),
	HIT: "hit", #enemey hitted
	HURT: preload("res://Assets/Sound/brother_hurt.wav"),
	WHISTLE : preload("res://Assets/Sound/whistle.mp3"),
	FALL: preload("res://Assets/Sound/fall2.mp3"),
	GAME_OVER: preload("res://Assets/Sound/game_over.mp3"),
	ENEMY_HURT: preload("res://Assets/Sound/EnemyHurt.wav"),
	MENU_SELECT: preload("res://Assets/Sound/MenuSelect.wav")
}

func play_clip(player: AudioStreamPlayer2D, clip_key: String) -> void:
	if SOUNDS.has(clip_key) == false:
		return
	player.stream = SOUNDS[clip_key]
	player.play()
