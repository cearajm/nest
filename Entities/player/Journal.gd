extends Node
class_name Journal


@export var window: Panel

func _ready() -> void:
	toggle_window(false)
	
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("journal"):
		toggle_window(!window.visible)


func toggle_window(is_open: bool):
	window.visible = is_open
	if is_open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
