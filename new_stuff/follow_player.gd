extends StateNew


@export var follow_state: StateNew

#@onready var nav_agent = %NavigationAgent3D
@onready var nav_agent = %NavigationAgent3D

@onready var player = get_tree().get_first_node_in_group("player")


var gravity = -30


	
#func _process(delta: float) -> void:
	##var target_location = player.global_transform.origin
	###print(target_location)
	##nav_agent.set_path_desired_distance(5)
	#pass
	
func process_physics(delta: float) -> StateNew:
	
	update_target_location(player.global_transform.origin)
	if !nav_agent.is_navigation_finished():
		print('not finished')
		
		var current_location = parent.global_transform.origin  # get global position
		var next_location = nav_agent.get_next_path_position()  # DO NOT PUT * DELTA HERE !!!! holyyy shit
		var new_velocity = (next_location - current_location).normalized() * move_speed  # direction vector at speed
			
		#print(nav_agent.target_position)
		#print(next_location)
		#print(new_velocity)
		#print("reachable: ", nav_agent.is_target_reached())
			
			

		# rotate enemy to face player
		#parent.look_at(Vector3(player.global_position.x, parent.global_position.y, player.global_position.z), Vector3.UP)
		#parent.velocity.move_toward(new_velocity, delta)
		var face_player = parent.global_transform.looking_at(player.global_transform.origin, Vector3.UP)
		parent.global_transform.basis = parent.global_transform.basis.slerp(face_player.basis, delta * rotation_speed)
		
		parent.velocity = new_velocity
		#parent.velocity = parent.velocity.move_toward(new_velocity, .25)
		
		parent.velocity.y = 0.0  # need for adjusting to player position, or else follows exact path
		parent.velocity.y = parent.velocity.y + _gravity * delta
		#print(nav_agent.velocity)
	
	else:
		print('finished')
		parent.velocity = Vector3.ZERO
	
	parent.move_and_slide()
	return null

# set target location (player), called in player script
func update_target_location(target_location) -> void:
	#target_location = player.global_transform.origin
	nav_agent.set_target_position(target_location)
	
func stop():
	pass  # stop a certain distance from player
