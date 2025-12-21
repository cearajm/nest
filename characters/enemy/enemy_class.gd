extends Node3D

class_name	Enemy

@export var health = 100 : set = _set_health
@export var progress_bar = ProgressBar
@export var collision_area = Area3D
@export var damage_amount = 5
var vulnerable = false

@onready var state_machine = %"state machine"

func _ready():
	progress_bar.max_value = health
	progress_bar.value = health
	# collision_area.body_entered.connect(_on_damage_taken)
	
	state_machine.init()
	
	
func _input(event) -> void:
	if vulnerable and event.is_action_pressed("left_click"):
		take_damage(damage_amount)
		print("ouch !")
		print("health:", health)
	
func take_damage(amount : int) -> void:
	health -= amount
	if health < 1:
		print("u r dead")
		self.get_parent().queue_free()
		
func _on_damage_taken(amount):
	print("hi")
	print("health:", health)
	take_damage(damage_amount)

func _on_collision_area_body_entered(body: Node3D) -> void:
	# print("woah")
	vulnerable = true
	
func _on_collision_area_body_exited(body: Node3D) -> void:
	vulnerable = false
	
func _set_health(new_value : int):
	health = new_value
	if progress_bar:
		progress_bar.value = health
