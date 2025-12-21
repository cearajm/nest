extends Node

@onready var player = $".."

var point = preload("res://test scenes/point.tscn")
var line = preload("res://test scenes/line.tscn")
var point_area = preload("res://test scenes/point_area.tscn")
var point_count : int = 6
var point_one : Vector3
var point_two : Vector3
var is_point_placed = false
var line_origin = null
var point_area_node = null
var enclosed = false
# var pos_offset = Vector3(0, 0, 1)


func _ready():
	pass
	
func inst():
	var point_instance = point.instantiate()
	
	point_instance.position = player.global_position # + pos_offset
	add_child(point_instance)
	
	if !is_point_placed:
		# place first point
		point_one = point_instance.position
		line_origin = point_one  # save point one as origin of drawn shape
		is_point_placed = true
		create_point_area(point_one)
	else:
		# place next point
		if point_area_node.is_in_area():  # if close to origin, place point at origin and complete shape
			point_instance.position = line_origin
			
		point_two = point_instance.position
		
		if point_one != point_two:
			draw_line(point_one, point_two)
			point_one = point_two
		else:
			remove_points()
		
	if point_count < 1 or enclosed:
		remove_points()
	else:
		point_count -= 1
	
	if line_origin == point_two:  # if circle closed
		enclosed = true
		
func remove_points():
	# delete all points
		for instance in self.get_children():
			remove_child(instance)
		point_count = 6
		is_point_placed = false
		line_origin = null
		enclosed = false
	
func create_point_area(point_pos):
	var point_area_instance = point_area.instantiate()
	point_area_instance.position = point_pos
	add_child(point_area_instance)
	point_area_node = self.get_node("point_area")
	
		
func draw_line(first_point, second_point):
	var line_instance = line.instantiate()
	line_instance.position = (first_point + second_point) / 2
	add_child(line_instance)
	line_instance.scale.z = first_point.distance_to(second_point)
	line_instance.look_at(second_point)


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("e"):
		inst()
	if Input.is_action_just_pressed("right_click"):
		remove_points()
	
	
	
	
	
	
