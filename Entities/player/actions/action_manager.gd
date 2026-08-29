extends Node
class_name ActionManager
# This is independent of the state machine. idk if this is the right thing to do though lol
# Treat this as the controller for the player actions i think.


@onready var place_point_action: PlayerAction = get_node("PlacePoint")
@onready var player: Player


func _ready() -> void:
	#for child in get_children():
		##child.player = self.player
		#print(player)
	print(player)
	pass
	
func init(player: Player) -> void:
	for child in get_children():
		child.player = player
		print(child.player)
		
	
func _input(event) -> void:
	if event.is_action_pressed("right_click"):
		#print("action: " + place_point_action.description)
		place_point_action.place_point()
		
