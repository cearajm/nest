extends PlayerAction


var point_scene = preload("res://Entities/player/actions/place_point/point.tscn")
var line_scene = preload("res://Entities/player/actions/line.tscn")
@onready var player: Player
#var description: String = "placed a point"
var max_charges: int = 4
var remaining_charges = max_charges
var prev_position = null
var current_position: Vector3
var origin: Vector3
var is_close = false


func place_point() -> void:
	var point = point_scene.instantiate()
	add_child(point)
	
	# place first point and connect its signal
	if prev_position == null:
		point.interaction_area.interaction_available.connect(_on_entered)
		point.interaction_area.interaction_unavailable.connect(_on_exited)
		origin = player.global_position
		print("origin")
		
	# connect to first point if close, else create a new one
	if is_close:
		point.position = origin
	else:
		point.position = player.global_position
		
	# start connecting after first point is placed
	if remaining_charges > 0 and prev_position:
		connect_points(prev_position, point.position)
	prev_position = point.position
	# decrement


func connect_points(line_start, line_end) -> void:
	var line = line_scene.instantiate()
	line.position = (line_start + line_end) / 2
	add_child(line)
	# resize and position the line
	line.scale.z = line_start.distance_to(line_end)
	line.look_at(line_end)
			
func remove_all_points() -> void:
	for child in get_children():
		child.queue_free()
		remaining_charges = max_charges
		prev_position = null
		
func _on_entered():
	print("get connected for free")
	is_close = true
	
func _on_exited():
	print("get unconnected")
	is_close = false
