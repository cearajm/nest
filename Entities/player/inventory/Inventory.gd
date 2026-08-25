extends Node
class_name Inventory


@onready var window: Panel = get_node("InventoryWindow")
@onready var info_text: Label = get_node("InventoryWindow/InfoText")
@export var starter_items: Array[Item]
var slots: Array[InventorySlot]


func _ready() -> void:
	# hide window and populate inventory with empty slot nodes
	toggle_window(false)	
	for child in get_node("InventoryWindow/SlotContainer").get_children():
		slots.append(child)
		child.set_item(null)
		child.inventory = self
	for item in starter_items:  # init starting items if u have any i guess
		add_item(item)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("inventory"):
		toggle_window(!window.visible)


func toggle_window(is_open: bool):
	window.visible = is_open
	if is_open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func add_item(item: Item):
	# add item if a slot is available
	var slot = get_slot_to_add(item)
	if slot == null:
		return
	
	if slot.item == null:
		slot.set_item(item)
	elif slot.item == item:  # increase quantity
		slot.add_item()


func remove_item(item: Item):
	var slot = get_slot_to_remove(item)
	if slot == null or slot.item == item:
		return
	slot.remove_item()


func get_slot_to_add(item: Item) -> InventorySlot:
	# check if the item can be stacked, else get an empty slot
	for slot in slots:
		if slot.item == item and slot.quantity < item.max_stack_size:
			return slot
	for slot in slots:
		if slot.item == null: return slot
	return null


func get_slot_to_remove(item: Item) -> InventorySlot:
	for slot in slots:
		if slot.item == item:
			return slot
	return null


func get_item_quantity(item: Item) -> int:
	var total = 0
	for slot in slots:
		if slot.item == item:
			total += slot.quantity
	return total


func on_give_player_item(item: Item, amount: int):
	pass
	
	
