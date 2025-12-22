extends StateNew


@onready var _camera: Camera3D = %Camera3D
@export var walk_state: StateNew

# inherit:
# var parent : Parent

func process_physics(delta: float) -> StateNew:
	# get movement input, and get forward and right coords of character
	var raw_input := Input.get_vector("left", "right", "forward", "back")
	var forward := _camera.global_basis.z
	var right := _camera.global_basis.x
	
	# calculate the move direction
	var move_direction := forward * raw_input.y + right * raw_input.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	
	#if can_move == false:  # stop movement during npc interaction
		#move_direction = Vector3.ZERO
		#velocity = Vector3.ZERO
		#
	#else:
	var y_velocity := parent.velocity.y
	#parent.velocity.y = 0.0
	#if Input.is_action_just_pressed("shift") and can_dash:
		#print("dash", dash_speed)
		#dashing = true
		#can_dash = false
		#dash_timer.start()
	#if dashing:
		#velocity = velocity.move_toward(move_direction * dash_speed, dash_acceleration * delta)
		#can_dash_timer.start()
	#else:
	parent.velocity = parent.velocity.move_toward(move_direction * move_speed, acceleration * delta)
	parent.velocity.y = y_velocity + _gravity * delta
	
	parent.move_and_slide()
	
	return null
