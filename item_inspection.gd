extends Node

@onready var item: Node3D
var rotation_speed: float = 0.3

var rotating = false
var prev_mouse_pos
var next_mouse_pos


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	item = get_child(0)  # index of first child
	

func _input(event):
	# mouse coordinates
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("click pos: ", event.position)
		if event.button_index == MOUSE_BUTTON_RIGHT:
			print(item.basis)

# use process instead of input because the mouse coordinates are updated every frame
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		rotating = true
		prev_mouse_pos = get_viewport().get_mouse_position()
	if Input.is_action_just_released("left_click"):
		rotating = false
		
	# get mouse movement and item.rotate around the corresponding axis
	# the item's parent is the world scene, so the basis of rotation is the global basis
	if rotating:
		next_mouse_pos = get_viewport().get_mouse_position()
		item.rotate_y((next_mouse_pos.x - prev_mouse_pos.x) * rotation_speed * delta)
		item.rotate_x(-(next_mouse_pos.y - prev_mouse_pos.y) * rotation_speed * delta)
		prev_mouse_pos = next_mouse_pos
		
		
		
		
