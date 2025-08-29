extends Control
@onready var button: Button = $PanelContainer/Button

@export var scene_to_load: PackedScene


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		var global_touch_pos = event.position
		var local_pos = global_touch_pos - button.global_position
		if Rect2(Vector2.ZERO, button.size).has_point(local_pos):
			_on_button_pressed()
func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(scene_to_load)
