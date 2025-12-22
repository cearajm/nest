extends Node


@export var starting_state : StateNew
@export var current_state : StateNew


# initialize by giving each child a reference to parent, enter default starting state
func init(parent: Player):
	print("asldkfja")
	for child in get_children():
		child.parent = parent
	change_state(starting_state)
	
func change_state(new_state : StateNew):
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter(get_process_delta_time())
	
func _physics_process(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
