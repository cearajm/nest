extends StateNew


@export var follow_state: StateNew

@onready var nav_agent = %NavigationAgent3D
@onready var enemy = $".."
@onready var player = get_tree().get_first_node_in_group("player")

# var turn_to = 0
#var speed = 3.0

func _process(delta: float) -> void:
	var target_location = player.global_transform.origin
	print(target_location)
	nav_agent.set_target_position(target_location)
	
func process_physics(delta: float) -> StateNew:
	
	
	var current_location = parent.global_transform.origin  # get global position
	var next_location = nav_agent.get_next_path_position()  # next location calculated by nav agent 3d
	var new_velocity = (next_location - current_location).normalized() * move_speed  # direction vector at speed
	
	# rotate enemy to face player
	parent.look_at(Vector3(player.global_position.x, parent.global_position.y, player.global_position.z), Vector3.UP)
	
	parent.velocity = new_velocity
	parent.velocity.y = 0.0
	parent.velocity.y = parent.velocity.y + _gravity * delta
	
	
	#nav_agent.set_target_position(player.global_transform.origin)
	##print(player.global_transform.origin)
	#print(nav_agent.get_current_navigation_path())

	
	parent.move_and_slide()
	#var target_location = player.global_transform.origin
	#print(target_location)
	#nav_agent.set_target_position(target_location)
	return null

## set target location (player), called in player script
#func update_target_location(target_location) -> void:
	#target_location = player.parent.global_transform.origin
	#nav_agent.set_target_position(target_location)
	#
func stop():
	pass  # stop a certain distance from player
