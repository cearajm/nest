extends CollisionShape3D


@onready var _camera_pivot : Node3D = %cameraPivot
@export_group("Camera")
@export_range(0.0, 1.0) var mouse_sensitivity := 0.25

var _camera_input_direction := Vector2.ZERO



func _ready() -> void:
	# initialize mouse capture
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _input(event: InputEvent) -> void:
	# detect if the mouse is captured in the game window and is moving.
	# control the camera view accordingly
	var is_camera_controlled := (
		event is InputEventMouseMotion and
		Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	)
	if is_camera_controlled:
		_camera_input_direction = event.screen_relative * mouse_sensitivity
		

func _process(delta: float) -> void:
	# _process: time independent, called every frame. delta = time since last frame
	# rotate camera on x axis
	_camera_pivot.rotation.x += _camera_input_direction.y * delta
	_camera_pivot.rotation.x = clamp(_camera_pivot.rotation.x, -PI / 6.0, PI / 3.0)  # limit range on x axis, 30 to 60 degrees
	# rotate on y axis
	_camera_pivot.rotation.y -= _camera_input_direction.x * delta
	_camera_input_direction = Vector2.ZERO  # stop movement (reset per frame)
	
	
