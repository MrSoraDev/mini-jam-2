extends Node

signal on_call_pressed() #player -> brother

signal on_brother_dead()

signal on_falling_end(position:Vector2)

signal on_scene_change(scene_name:String)

signal on_brother_hurt()

signal on_hud_game_over()

signal on_player_hurt()

signal on_enemy_hurt()

signal change_brother_health(amount: float)

signal save_brother_health(brother_health: float)
