extends Node


@export var starting_state : State
@export var current_state : State
# @onready var enemy = %Enemy

# initialize by giving each child a reference to parent, enter default starting state
func init():
	print("asldkfja")
	change_state(starting_state)
	
func change_state(new_state : State):
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter(get_process_delta_time())
	
func _physics_process(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
		
