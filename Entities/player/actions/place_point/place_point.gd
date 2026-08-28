extends PlayerAction


var point_scene = preload("res://Entities/player/actions/place_point/point.tscn")
@onready var player: Player
var description: String = "placed a point"



func place_point() -> void:
	print("hello placed ", player)
	var point = point_scene.instantiate()
	
	point.position = player.global_position
