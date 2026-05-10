extends Node

@onready var item: Node3D
var rotation_speed: float = 10.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	item = get_child(0)
	

func _input(event):
	# mouse coordinates
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("click pos: ", event.position)
		if event.button_index == MOUSE_BUTTON_RIGHT:
			print(item.basis)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
