extends Node
class_name InventorySlot
# manages the item and its attributes in a slot

@onready var icon: TextureRect = get_node("Icon")
@onready var quantity_text: Label = get_node("QuantityText")
var inventory: Inventory
var item: Item
var quantity: int


func _ready() -> void:
	pass
	

func set_item(new_item: Item):
	# assign item to an item variable, and qty == 1 by default
	item = new_item
	quantity = 1
	if item == null:
		#icon.visible = false  # empty the slot
		icon.visible = true  # for testing, show placeholder for item
	else:
		icon.visible = true  # show item image
		icon.texture = item.icon
	update_quantity_text()


func update_quantity_text():
	if quantity <= 1:
		quantity_text.text = ""
	else:
		quantity_text.text = str(quantity)


func add_item():
	quantity += 1
	update_quantity_text()

func remove_item():
	quantity -= 1
	update_quantity_text()
	if quantity == 0:
		set_item(null)


func _on_pressed() -> void:
	if item == null:
		return
		
	var remove_after_use = item._on_use(inventory.get_parent())
	if remove_after_use:
		remove_item()
