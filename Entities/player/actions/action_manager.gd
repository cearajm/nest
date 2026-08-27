extends Node
class_name ActionManager
# This is independent of the state machine. idk if this is the right thing to do though lol
# Treat this as the controller for the player actions i think.


@onready var place_point_action: PlayerAction = get_node("PlacePoint")

func _ready() -> void:
	pass # Replace with function body.
	
func _input(event) -> void:
	if event.is_action_pressed("right_click"):
		print("action: " + place_point_action.description)
		
