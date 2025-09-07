extends Area2D

var colMask : CollisionShape2D

func _ready() -> void:
	print("%s ready!" % [name])
	if(get_child(1) is CollisionShape2D):
		colMask = get_child(1)
	else:
		assert("Invalid Inventory Slot!")


func _on_mouse_entered() -> void:
	print("Mouse entered %s" % [name])


func _on_mouse_exited() -> void:
	print("Mouse left %s" % [name])



func get_buinventory_index(eventPosition: Vector2):
	if Rect2(Vector2.ZERO, colMask.size).has_point(eventPosition - colMask.global_position):
		return 1
	else:
		return 0
