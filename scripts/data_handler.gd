extends Node

var player_character_location : Vector2 = Vector2(0,0)
var player_character_health : int = 0

func _process(delta: float) -> void:
		
	if Input.is_action_pressed("pause_menu"):
		get_tree().set_auto_accept_quit(false)
		get_tree().quit(0)
