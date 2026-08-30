extends Area3D
class_name InteractionArea

@onready var item_data: ItemData
@onready var parent = get_parent()


# signals for interaction possibilities
# so inputs are only processed when colliding
# connect signals to the script with interaction logic (in this case, the main scene)
signal interaction_available
signal interaction_unavailable
# 2 options for item interaction: e to inspect and left click to pick up
signal interacted
signal picked_up
#signal placed_point



func _ready() -> void:
	# turn off unhandled input so input processing is prevented by default
	# otherwise every item instance will process input on key press
	set_process_unhandled_input(false)
	
func _unhandled_input(event: InputEvent) -> void:
	# this only runs when unhandled input processing is enabled
	if event.is_action_pressed("e"):
		interacted.emit()
		print("interacting with ", parent)
		
	# can't use match statement for custom class types :(
	if event.is_action_pressed("left_click"):
		if parent is Item:
			if item_data:
				picked_up.emit()
				print("picking up")
			else:
				print("missing ItemData resource")
		
	#elif event.is_action_pressed("right_click") and parent is Point:
		#placed_point.emit()
	

func _on_area_3d_body_entered(_body: Node3D) -> void:
	# enable interaction (start processing)
	set_process_unhandled_input(true)
	interaction_available.emit()
	#print("item: ", get_parent().name)
	

func _on_area_3d_body_exited(_body: Node3D) -> void:
	# disable interaction (stop processing)
	set_process_unhandled_input(false)
	interaction_unavailable.emit()
