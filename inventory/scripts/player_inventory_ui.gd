extends Control

@export var inventory: Inventory
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


var is_open = false

func _ready():
	inventory.update.connect(update_slots)
	update_slots()
	close()
	
#func _input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("right_click"):
		#print("click")
	
func update_slots():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])
		
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("i"):
		if is_open:
			close()
		else:
			open()
	
func open():
	visible = true
	is_open = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func close():
	visible = false
	is_open = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
