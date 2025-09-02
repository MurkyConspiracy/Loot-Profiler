extends CanvasLayer
@onready var health_graphic: TextureProgressBar = $MarginContainer/VBoxContainer/PanelContainer/HBoxContainer/HealthContainer/HealthGraphic
@onready var health_value: Label = $MarginContainer/VBoxContainer/PanelContainer/HBoxContainer/HealthContainer/HealthValue

@onready var margin_container: MarginContainer = $MarginContainer
@onready var skill_button_1: Button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/SkillButton1
@onready var skill_button_2: Button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/SkillButton2
@onready var skill_button_3: Button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/SkillButton3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(DataHandler.is_node_ready() && DataHandler.player_character_health != null):
		health_value.text = str(DataHandler.player_character_health)
		health_graphic.value = DataHandler.player_character_health
	
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		match get_button_index(event.position):
			1:
				print("Skill Button 1!")
				return
			2:
				print("Skill Button 2!")
				return
			3:
				print("Skill Button 3!")
				return
	
func get_button_index(eventPosition: Vector2):
	if Rect2(Vector2.ZERO, skill_button_1.size).has_point(eventPosition - skill_button_1.global_position):
		return 1
	elif Rect2(Vector2.ZERO, skill_button_2.size).has_point(eventPosition - skill_button_2.global_position):
		return 2
	elif Rect2(Vector2.ZERO, skill_button_3.size).has_point(eventPosition - skill_button_3.global_position):
		return 3
