extends CanvasLayer
@onready var health_value: Label = $PanelContainer/HBoxContainer/HealthContainer/HealthValue
@onready var health_graphic: TextureProgressBar = $PanelContainer/HBoxContainer/HealthContainer/HealthGraphic


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health_value.text = str(DataHandler.player_character_health)
	health_graphic.value = DataHandler.player_character_health
	
