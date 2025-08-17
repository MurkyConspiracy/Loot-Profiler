extends RigidBody2D
@onready var gnome: Node2D = $"."
@export var SPEED: int = 20

func _physics_process(delta: float) -> void:
	linear_velocity = (DataHandler.player_character_location - global_transform.origin).normalized() * SPEED
