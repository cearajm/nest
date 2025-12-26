extends CharacterBody3D
class_name EnemyNew

@onready var health = $health
@onready var state_machine = $state_machine
@onready var in_range: bool = false
@export var skin: Node3D

#@onready var player = get_tree().get_first_node_in_group("player")
#@onready var nav_agent = %NavigationAgent3D


func _ready() -> void:
	print('hi i am evil')
	state_machine.init(self)



#func update_target_location(target_location) -> void:
	#nav_agent.set_target_position(target_location)
	##print("final: ", nav_agent.get_current_navigation_result())
	#print("target: ", target_location)



	
