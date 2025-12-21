extends Node

@export var health = 100 : set = _set_health
@export var progress_bar = ProgressBar
@export var collision_area = Area3D
@export var damage_amount = 5
var vulnerable = false
var is_hit = false
var max_health = health

func _ready():
	progress_bar.max_value = health
	progress_bar.value = health
	# collision_area.body_entered.connect(_on_damage_taken)
	
#func _process(delta: float) -> void:
	#if vulnerable and is_hit:  # and is hit
		#take_damage(damage_amount)
		#print("ouch !")
		#print("health:", health)
		
func is_vulnerable():
	return vulnerable
	
func set_is_hit(hit):
	is_hit = hit
	print(is_hit)
	
func take_damage(amount : int) -> void:
	health -= amount
	if health < 1:
		print("u r dead")
		
func heal(amount : int):
	health += amount
	if health >= max_health:
		health = max_health
	print(health)
		
func _on_damage_taken(_amount):
	print("hi")
	print("health:", health)
	take_damage(damage_amount)

func _on_area_3d_body_entered(_body: Node3D) -> void:
	print("ew")
	vulnerable = true
	
func _on_area_3d_body_exited(_body: Node3D) -> void:
	vulnerable = false
	
func _set_health(new_value : int):
	health = new_value
	if progress_bar:
		progress_bar.value = health
		
