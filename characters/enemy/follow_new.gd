extends "res://characters/State.gd"

@export var attack_state : State


var speed = 3.0
var rotation_speed = 12.0
var gravity = -30
@onready var enemy = $"../.."
@onready var nav_agent = %NavigationAgent3D
# print(nav_agent)
@onready var player = get_tree().get_first_node_in_group("player")

func process_physics(delta) -> State:
	
	var current_location = enemy.global_transform.origin  # get global position
	var next_location = nav_agent.get_next_path_position()  # next location calculated by nav agent 3d
	var new_velocity = (next_location - current_location).normalized() * speed  # direction vector at speed
	
	# rotate enemy to face player
	enemy.look_at(Vector3(player.global_position.x, enemy.global_position.y, player.global_position.z), Vector3.UP)
	
	enemy.velocity = new_velocity
	enemy.velocity.y = 0.0
	enemy.velocity.y = enemy.velocity.y + gravity * delta
	enemy.move_and_slide()
	
	if player.get_node("health").is_vulnerable():
		return attack_state
	
	return null
	

# set target location (player), called in player script
func update_target_location(target_location) -> void:
	nav_agent.set_target_position(target_location)
	
func stop():
	pass  # stop a certain distance from player
	
	
