extends PlayerAction


var point_scene = preload("res://Entities/player/actions/place_point/point.tscn")
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
		
		# if a previous point exists, connect it to the current one
		connect_points(prev_position, point.position)
		#else:
			#print("is first")
		
		prev_position = point.position
		remaining_charges -= 1
		
	# clear once you run out of charges
	else:
		remove_all_points()
		
func connect_points(prev_position, current_position) -> void:
	if prev_position:
		print(prev_position)
		print(current_position)
			
func remove_all_points() -> void:
	for child in get_children():
		child.queue_free()
		remaining_charges = max_charges
		prev_position = null
	
