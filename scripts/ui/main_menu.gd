extends Control

@onready var play_button: Button = $"CenterContainer/VBoxContainer/Play Button"
@onready var settings_button: Button = $"CenterContainer/VBoxContainer/Settings Button"
@onready var exit_button: Button = $"CenterContainer/VBoxContainer/Exit Button"

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		match get_button_index(event.position):
			1:
				_on_play_button_pressed()
			3:
				get_tree().quit(0)
			
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func get_button_index(eventPosition: Vector2):
	
	if Rect2(Vector2.ZERO, play_button.size).has_point(eventPosition - play_button.global_position):
		return 1
	elif Rect2(Vector2.ZERO, settings_button.size).has_point(eventPosition - settings_button.global_position):
		return 2
	elif Rect2(Vector2.ZERO, exit_button.size).has_point(eventPosition - exit_button.global_position):
		return 3
