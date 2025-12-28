extends CharacterBody3D
class_name EnemyNew

@onready var health = $health
@onready var state_machine = $state_machine
@onready var in_range: bool = false
@export var skin: Node3D

@onready var animations: AnimationPlayer = $"nest temp/AnimationPlayer"

#@onready var player = get_tree().get_first_node_in_group("player")
#@onready var nav_agent = %NavigationAgent3D


func _ready() -> void:
	print('hi i am evil')
	state_machine.init(self)






	
