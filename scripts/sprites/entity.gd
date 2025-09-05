class_name Entity extends RigidBody2D

var pre_pause_velocity : Vector2 = Vector2.ZERO

func _ready() -> void:
	DataHandler.pausables.append($".")

func set_pause_state(paused : bool = false) -> void:
	
	set_process(paused)
	set_process_input(paused)
	set_process_internal(paused)
	set_physics_process(paused)
	set_physics_process_internal(paused)
	
	if(paused):
		pre_pause_velocity = linear_velocity
		linear_velocity = Vector2.ZERO
	else:
		linear_velocity = pre_pause_velocity
