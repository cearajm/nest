extends Node
class_name InventorySlot


@onready var icon: TextureRect = get_node("Icon")
@onready var quantity_text: Label = get_node("QuantityText")
var inventory: Inventory
var item: Item
var quantity: int


func _ready() -> void:
	pass
	

func set_item(new_item: Item):
	pass
	
func add_item():
	pass
	
func remove_item():
	pass
	
func update_quantity_text():
	pass
