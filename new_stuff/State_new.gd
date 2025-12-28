extends Node
class_name StateNew

@export_group("Movement")
@export var move_speed := 8.0
@export var acceleration := 20.0
@export var rotation_speed := 12.0
@export var jump_impulse := 12.0

@export var dash_speed := 100.0
@export var dash_acceleration := 100.0






var _gravity := -30.0

var parent: CharacterBody3D

func enter(delta : float) -> void:
	pass
	
func exit() -> void:
	pass
	
# func get_enemy():
	# return enemy
	

	
func process_input(event: InputEvent) -> StateNew:
	return null


func process_physics(delta: float) -> StateNew:
	return null
	

	
