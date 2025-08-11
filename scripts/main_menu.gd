extends Control

@onready var play_button: Button = $"CenterContainer/VBoxContainer/Play Button"



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
