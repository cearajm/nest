extends CharacterBody3D
class_name EnemyNew

@onready var health = $health
@onready var state_machine = $state_machine
@onready var in_range: bool = false
@export var skin: Node3D



func _ready() -> void:
	print('hi i am evil')
	state_machine.init(self) 



	
