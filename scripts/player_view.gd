extends CanvasLayer
@onready var health_graphic: TextureProgressBar = %HealthGraphic
@onready var health_value: Label = %HealthValue
@onready var health_label: Label = %HealthLabel

@onready var margin_container: MarginContainer = $MarginContainer
@onready var skill_button_1: Button = %SkillButton1
@onready var skill_button_2: Button = %SkillButton2
@onready var skill_button_3: Button = %SkillButton3

@onready var level_name_label: Label = %LevelNameLabel

@onready var inventory_button: Button = %InventoryButton
@onready var menu_button: Button = %MenuButton



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_name_label.text = get_tree().current_scene.name


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
			4:
				load_inventory()
			5:
				load_menu()
	
func get_button_index(eventPosition: Vector2):
	if Rect2(Vector2.ZERO, skill_button_1.size).has_point(eventPosition - skill_button_1.global_position):
		return 1
	elif Rect2(Vector2.ZERO, skill_button_2.size).has_point(eventPosition - skill_button_2.global_position):
		return 2
	elif Rect2(Vector2.ZERO, skill_button_3.size).has_point(eventPosition - skill_button_3.global_position):
		return 3
	elif Rect2(Vector2.ZERO, inventory_button.size).has_point(eventPosition - inventory_button.global_position):
		return 4
	elif Rect2(Vector2.ZERO, menu_button.size).has_point(eventPosition - menu_button.global_position):
		return 5

func load_inventory():
	print("Inventory!")
	
	
func load_menu():
	print("Menu!")
