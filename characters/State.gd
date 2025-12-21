extends Node

class_name State

#@onready var nav_agent : NavigationAgent3D
#
#@onready var enemy : Node3D
#@onready var player = CharacterBody3D

func enter(delta : float) -> void:
	pass
	
func exit() -> void:
	pass
	
# func get_enemy():
	# return enemy

func process_physics(delta: float) -> State:
	return null
	

	
