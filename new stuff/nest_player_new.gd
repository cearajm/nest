extends CharacterBody3D

## handles character physics and camera spring arm

@export var inventory: Inventory

# export class  member, editable in property editor
@export_group("Camera")
@export_range(0.0, 1.0) var mouse_sensitivity := 0.25

@export_group("Movement")
@export var move_speed := 8.0
@export var acceleration := 20.0
@export var rotation_speed := 12.0
@export var jump_impulse := 12.0

# dash
@export var dash_speed := 100.0
@export var dash_acceleration := 100.0
var dashing = false
var can_dash = true
@onready var dash_timer = $dash_timer
@onready var can_dash_timer = $can_dash_timer

@onready var footsteps_stone = $AudioStreamPlayer3D
	

# keep track of mouse motion
var _camera_input_direction := Vector2.ZERO
var _last_movement_direction := Vector3.BACK
var _gravity := -30.0

# reference to camera pivot node
@onready var _camera_pivot : Node3D = %cameraPivot
@onready var _camera: Camera3D = %Camera3D
@onready var _skin: Node3D = $nest
@onready var can_move = true

@onready var animations = $"nest/nest temp/AnimationPlayer"

		
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	# footsteps_stone.pitch_scale = 0.5

func toggle_move():
	if can_move:
		can_move = false
	else:
		can_move = true
	
# check for mouse motion
func _unhandled_input(event: InputEvent) -> void:
	var is_camera_motion := (  # bool
		event is InputEventMouseMotion and   # mouse movement
		Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED   # mouse in window
	)
	if is_camera_motion:
		_camera_input_direction = event.screen_relative * mouse_sensitivity
		
func _physics_process(delta: float) -> void:
	# rotate on x axis, delta = time based
	_camera_pivot.rotation.x += _camera_input_direction.y * delta
	_camera_pivot.rotation.x = clamp(_camera_pivot.rotation.x, -PI / 6.0, PI / 3.0)  # limit movement on x axis, 30 to 60 degrees
	# rotate on y axis
	_camera_pivot.rotation.y -= _camera_input_direction.x * delta
	
	_camera_input_direction = Vector2.ZERO  # stop movement (reset per frame)
	
	# get input direction
	var raw_input := Input.get_vector("left", "right", "forward", "back")
	# var dance := Input.is_key_pressed(KEY_E)
	# get forward and right of character
	var forward := _camera.global_basis.z
	var right := _camera.global_basis.x
	
	# calculate the move direction
	var move_direction := forward * raw_input.y + right * raw_input.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	
	if can_move == false:  # stop movement during npc interaction
		move_direction = Vector3.ZERO
		velocity = Vector3.ZERO
		
	else:
		var y_velocity := velocity.y
		velocity.y = 0.0
		if Input.is_action_just_pressed("shift") and can_dash:
			print("dash", dash_speed)
			dashing = true
			can_dash = false
			dash_timer.start()
		if dashing:
			velocity = velocity.move_toward(move_direction * dash_speed, dash_acceleration * delta)
			can_dash_timer.start()
		else:
			velocity = velocity.move_toward(move_direction * move_speed, acceleration * delta)
		velocity.y = y_velocity + _gravity * delta
		
#region footsteps
		#if move_direction:
			#if is_on_floor():
				#if !footsteps_stone.playing:
					#footsteps_stone.pitch_scale = randf_range(0.5, 0.75)
					#footsteps_stone.play()
		#else:
			#footsteps_stone.stop()
#endregion
		
		
	var is_starting_jump := Input.is_action_just_pressed("jump") and is_on_floor()
	if is_starting_jump:
		velocity.y += jump_impulse
		
	
	# $AnimationTree.set("parameters/conditions/idle", raw_input == Vector2.ZERO)
	# $AnimationTree.set("parameters/conditions/run", raw_input != Vector2.ZERO and can_move)
	# $AnimationTree.set("parameters/conditions/dance", dance)
	

	# give player location to enemies
	get_tree().call_group("enemy", "update_target_location", self.global_transform.origin)  # get location once, update all enemy groups
	
	# dash
	
	
		
	move_and_slide()
	
	if move_direction.length() > 0.2:
		_last_movement_direction = move_direction
	# calculate angle to turn to
	var target_angle := Vector3.BACK.signed_angle_to(_last_movement_direction, Vector3.UP)

	_skin.rotation.y = lerp_angle(_skin.rotation.y, target_angle, rotation_speed * delta)
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		animations.play("slash_fast")
		
func collect(item):
	inventory.insert(item)


func _on_dash_timer_timeout() -> void:
	dashing = false


func _on_can_dash_timer_timeout() -> void:
	can_dash = true
