extends Node3D


@onready var item_viewport: Node2D = $item_viewport
@onready var player: Player = get_tree().get_first_node_in_group("player")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("e"):
		player.toggle_movement()
		if item_viewport.visible == false:
			item_viewport.show()
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			item_viewport.hide()
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
