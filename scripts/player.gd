
class_name PlayerCharacter extends CharacterBody2D
const SPEED = 80.0
var player_character_health : int

#########################
#	Built In Ready 		#
#	Variable Assignment #
#########################
func _ready() -> void:
	player_character_health = 100

#########################
#  Built In PHYS Process#
#	Handle movement		#
#########################
func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("player_left","player_right")
	if xdirection:
		velocity.x = xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var ydirection := Input.get_axis("player_up","player_down")
	if ydirection:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	DataHandler.player_character_location = global_position

	move_and_slide()


#################
#	Take Damage	#
# Takes Source	#
#################

func take_damage(damage: int, source: Node):
	player_character_health -=damage
	print("Ouch! Health at %s" % [player_character_health])
