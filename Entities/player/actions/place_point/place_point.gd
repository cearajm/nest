extends PlayerAction


var point_scene = preload("res://Entities/player/actions/place_point/point.tscn")
var line_scene = preload("res://Entities/player/actions/line.tscn")
@onready var player: Player
#var description: String = "placed a point"
var max_charges: int = 4
var remaining_charges = max_charges
var prev_position = null


func place_point() -> void:
	# if max charges not reached
	if remaining_charges > 0:
		var point = point_scene.instantiate()
		point.position = player.global_position
		add_child(point)
		
		var current_position = point.position
		if prev_position:
			connect_points(prev_position, current_position)
		prev_position = point.position
		remaining_charges -= 1
		
	else:
		remove_all_points()
		
func connect_points(line_start, line_end) -> void:
	print(line_start)
	print(line_end)
	var line = line_scene.instantiate()
	line.position = (line_start + line_end) / 2
	add_child(line)
	line.scale.z = line_start.distance_to(line_end)
	line.look_at(line_end)
			
func remove_all_points() -> void:
	for child in get_children():
		child.queue_free()
		remaining_charges = max_charges
		prev_position = null
	
