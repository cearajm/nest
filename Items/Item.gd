extends Node3D
class_name Item

@onready var interaction_area: InteractionArea = $InteractionArea
@export var item_data: ItemData

# TODO: create ItemData script and make a .tres for each item
# give each item object a ref to the resource
# when an item is picked up, get this item ref for inventory slot handler

func _ready() -> void:
	if item_data:
		interaction_area.item_data = item_data
		print(item_data.display_name + ": ", item_data.description)
	else:
		print("missing ItemData resource")


func _on_use(player: Player):
	# TODO: add the effects of using each item, and update player attributes if needed
	# how do i do that. i think extend Item and override this function ??
	print(item_data.display_name + " used by " + player.name)
	return true
