extends Node3D


@onready var item_viewport: Node2D = $item_viewport
@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var cube: Node3D = $Cube

# TODO: pause input processing for the subviewport when not inspecting (like in the collision area processing)
# TODO: group inspectable items in the scene tree and iterate to connect all their signals to the inspection method
# TODO: add item as a child of the subviewport

func _ready() -> void:
	# connect signals
	cube.interacted.connect(inspect_cube.bind(cube))
	
	
func inspect_cube(object) -> void:
	# toggle the item subviewport visibility and pause movement
	player.toggle_movement()
	item_viewport.visible = !item_viewport.visible
	if item_viewport.visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	print(object.name)
	
	
