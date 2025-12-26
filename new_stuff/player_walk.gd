extends StateNew


@onready var _camera: Camera3D = %Camera3D
@export var walk_state: StateNew

var _last_movement_direction := Vector3.BACK
var is_dashing = false
var can_dash = true
var dash_timer: float
var cooldown_timer: float

# inherit:
# var parent : Parent

#func process(delta: float) -> void:
	### give player location to enemies
	#get_tree().call_group("enemy", "update_target_location", parent.global_transform.origin)  # get location once, update all enemy groups

func process_physics(delta: float) -> StateNew:
	# get movement input, and get forward and right coords of character
	var raw_input := Input.get_vector("left", "right", "forward", "back")
	var forward := _camera.global_basis.z
	var right := _camera.global_basis.x
	
	# calculate the direction to move in
	var move_direction := forward * raw_input.y + right * raw_input.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	
	#if can_move == false:  # stop movement during npc interaction
		#move_direction = Vector3.ZERO
		#velocity = Vector3.ZERO
		#
	#else:
	var y_velocity := parent.velocity.y
	parent.velocity.y = 0.0

	# handle dash movement -> track duration of dash and its cooldown
	if Input.is_action_just_pressed("shift") and can_dash:
		print("dash", dash_speed)
		is_dashing = true
		can_dash = false
		dash_timer = 0.1
		cooldown_timer = 1.0
	
	# count down in delta time and reset cooldowns
	dash_timer -= delta
	cooldown_timer -= delta
	if dash_timer < 0:
		is_dashing = false
	if cooldown_timer < 0:
		can_dash = true
		
	# set velocity to dash speed or walking speed
	if is_dashing:
		print('hji')
		parent.velocity = parent.velocity.move_toward(move_direction * dash_speed, dash_acceleration * delta)
	else:
		parent.velocity = parent.velocity.move_toward(move_direction * move_speed, acceleration * delta)
	parent.velocity.y = y_velocity + _gravity * delta
	

	# calculate angle and rotate the player to face forward when moving
	if move_direction.length() > 0.2:
		_last_movement_direction = move_direction
	var _target_angle := Vector3.BACK.signed_angle_to(_last_movement_direction, Vector3.UP)
	parent.skin.rotation.y = lerp_angle(parent.skin.rotation.y, _target_angle, rotation_speed * delta)
	
	
	# handle jump
	var is_starting_jump := Input.is_action_just_pressed("jump") and parent.is_on_floor()
	if is_starting_jump:
		parent.velocity.y += jump_impulse
	
	
	parent.move_and_slide()
	
	return null
	
	

	
