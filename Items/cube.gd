extends Node3D


var player_in_area = false	
var player = null

# signals for interaction possibilities
# so inputs are only processed when colliding
# connect signals to script with interaction logic
signal interaction_available
signal interaction_unavailable
signal interacted  # interaction is detected


func _ready() -> void:
	# turn off unhandled input so input processing is prevented by default
	# otherwise every item instance will process input on key press
	set_process_unhandled_input(false)
	
func _unhandled_input(event: InputEvent) -> void:
	# this only runs when unhandled input processing is enabled
	if event.is_action_pressed("e"):
		interacted.emit()
	
func _process(_delta):
	# TEMP
	if player_in_area and Input.is_action_just_pressed("e"):
		print("in range")

func _on_area_3d_body_entered(body: Node3D) -> void:
	# enable interaction (start processing)
	set_process_unhandled_input(true)
	interaction_available.emit()
	print("entered")
	

func _on_area_3d_body_exited(_body: Node3D) -> void:
	# disable interaction (stop processing)
	set_process_unhandled_input(false)
	interaction_unavailable.emit()
	print("exited")
