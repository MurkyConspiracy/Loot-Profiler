extends Node

var player_character_location : Vector2 = Vector2(0,0)
var player_character_health : int = 0
var player_character_ref : CharacterBody2D

var inventory_view_ref : CanvasLayer
var player_view_ref : CanvasLayer

var fullpause : bool = false
var pausables : Array = []


func _process(delta: float) -> void:
	if Input.is_action_pressed("pause_menu"):
		get_tree().set_auto_accept_quit(false)
		get_tree().quit(0)

func set_pause_state(paused : bool = false) -> void:
	fullpause = paused
	if(player_character_ref.has_method("set_pause_state")):
		player_character_ref.call("set_pause_state", paused)
	else:
		assert("Invalid Player Pause!!!")

	
	for pausable in pausables:
		if(pausable.has_method("set_pause_state")):
			pausable.call("set_pause_state", paused)
		else:
			assert("Invalid Pause on Pausable: %s" % [pausable.name])
