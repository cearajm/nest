extends StateNew


@export var follow_state: StateNew
@onready var nav_agent = %NavigationAgent3D
@onready var player = get_tree().get_first_node_in_group("player")

	
func process_physics(delta: float) -> StateNew:
	# the enemy receives the player's position every frame, and adjusts its path to follow.
	# set the player's current position as the nav target:
	if player: 
		nav_agent.set_target_position(player.global_transform.origin)
	
	if !nav_agent.is_navigation_finished():
		# if end of path is not reached, update vector path to the player's updated position
		var current_location = parent.global_transform.origin
		var next_location = nav_agent.get_next_path_position()  # DO NOT PUT * DELTA HERE !!!! holyyy shit
		var new_velocity = (next_location - current_location).normalized() * move_speed  # direction vector at speed
			
		# rotate enemy to face player (replaced look_at with slerp)
		var face_player = parent.global_transform.looking_at(player.global_transform.origin, Vector3.UP)
		parent.global_transform.basis = parent.global_transform.basis.slerp(face_player.basis, delta * rotation_speed)
		
		parent.velocity = new_velocity
		parent.velocity.y = 0.0  # need for adjusting to player position, or else follows exact path
		parent.velocity.y = parent.velocity.y + _gravity * delta
	
	else:
		# stop nav_agent updates, and stop moving
		parent.velocity = Vector3.ZERO
	
	parent.move_and_slide()
	return null


func stop():
	pass  # stop a certain distance from player
