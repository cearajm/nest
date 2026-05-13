extends Node3D


@onready var item_viewport: Node2D = $item_viewport
@onready var player: Player = get_tree().get_first_node_in_group("player")
#@onready var cube: Node3D = $Cube
#@onready var donut: Node3D = $Donut
#@onready var cylinder: Node3D = $Cylinder
@onready var items: Node = %items


# TODO: pause input processing for the subviewport when not inspecting (like in the collision area processing)
# TODO: group inspectable items in the scene tree and iterate to connect all their signals to the inspection method
# TODO: make interaction area into a class
# TODO: consistent naming conventions for item/object

func _ready() -> void:
	# connect signals
	#cube.interaction_area.interacted.connect(inspect_cube.bind(cube))
	#donut.interaction_area.interacted.connect(inspect_cube.bind(donut))
	#cylinder.interaction_area.interacted.connect(inspect_cube.bind(cylinder))
	for child in items.get_children():
		child.interaction_area.interacted.connect(inspect_item.bind(child))
		print(child.name)
	
	
	
func inspect_item(object) -> void:
	# object: the item just picked up
	# toggle the item subviewport visibility and pause movement
	player.toggle_movement()
	item_viewport.visible = !item_viewport.visible
	
	if item_viewport.visible:
		var object_copy = object.duplicate()
		object.visible = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
		# add the item to the subviewport
		print(object_copy.visible)
		item_viewport.add_item(object_copy)
		
	else:
		object.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		item_viewport.item_container.get_child(0).queue_free()  # reset subviewport

		
	
