extends Control

@onready var play_button: Button = $"CenterContainer/VBoxContainer/Play Button"


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		var global_touch_pos = event.position
		var local_pos = global_touch_pos - play_button.global_position
		if Rect2(Vector2.ZERO, play_button.size).has_point(local_pos):
			_on_play_button_pressed()
			
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
