extends Node
class_name Health

@export var max_health: float
@export var health_bar: ProgressBar  # health_value
@export var collision_area: Area3D
@export var damage_amount: float = 5

@onready var health_value = max_health


func _ready() -> void:
	#print('health: ',  health_value)
	health_bar.max_value = max_health
	health_bar.value = max_health

	
func take_damage(damage_amount):
	health_value -= damage_amount
	health_bar.value = health_value
	print(health_value)
	
	if health_value < 0:
		var root = self.get_tree().get_root()
		if root is EnemyNew:
			die()
	
	
func die():
	#print('u died')
	self.get_parent().queue_free()
	health_value = max_health
	health_bar.value = health_value
