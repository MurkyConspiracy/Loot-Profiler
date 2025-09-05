extends CanvasLayer
@onready var inventory_view: CanvasLayer = $"."
@onready var close_inventory: Button = %CloseInventory

func _ready() -> void:
	hide()
	set_process_input(false)
	DataHandler.inventory_view_ref = inventory_view
	
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		match get_button_index(event.position):
			1:
				DataHandler.player_view_ref.show()
				DataHandler.player_view_ref.set_process_input(true)
				DataHandler.inventory_view_ref.hide()
				DataHandler.inventory_view_ref.set_process_input(false)
				DataHandler.set_pause_state(true)
				

func get_button_index(eventPosition: Vector2):
	if Rect2(Vector2.ZERO, close_inventory.size).has_point(eventPosition - close_inventory.global_position):
		return 1
	else:
		return 0
