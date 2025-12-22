extends StateNew



func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	# name _input with underscore -- is called regardless of current State
	if event.is_action_pressed("left_click"):
		parent.animations.play("slash_fast")


# additions:
# attack animations, attack types
# hurt state
# resting and sitting
# idle
