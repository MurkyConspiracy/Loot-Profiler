class_name Gnome extends Entity
@onready var gnome: Node2D = $"."
@export var SPEED: int = 20
@onready var attack_label: Label = $AttackLabel
@onready var attack_timer: Timer = $AttackTimer
@onready var attack_range_area: Area2D = $AttackRangeArea

var player_ref : CharacterBody2D

func _physics_process(delta: float) -> void:
	linear_velocity = (DataHandler.player_character_location - global_transform.origin).normalized() * SPEED
	
func _on_attack_timer_timeout() -> void:
	attack_label.visible=false
	print("Try attack...")
	if randi_range(1, 100) <= 70:
		print("attack!")
		attack_label.visible = true
		for area in attack_range_area.get_overlapping_areas():
			if(
				(area.get_parent().get_script() != null) &&
				((area.get_parent().get_script() as Script).get_global_name() == "PlayerCharacter") &&
				(area.get_parent().has_method("take_damage"))):
					area.get_parent().call("take_damage", 1, gnome)




func _on_attack_range_area_area_entered(area: Area2D) -> void:	
	if ((area.get_parent().get_script() as Script).get_global_name() == "PlayerCharacter"):
		attack_timer.start(1)
