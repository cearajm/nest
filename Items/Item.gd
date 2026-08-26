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
