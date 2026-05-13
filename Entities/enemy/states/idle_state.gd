extends StateNew


@onready var player: Player
@onready var nav_agent = %NavigationAgent3D
@onready var follow_state = %follow

var can_attack: bool = false
var cooldown_timer: float
var aggro: bool = false

@export var health : Health


func _ready() -> void:
	move_speed = 0.0
	print("state: idle")
	print(health.health_value)

#func process_physics(delta: float) -> StateNew:
	## the enemy receives the player's position every frame, and adjusts its path to follow.
	## set the player's current position as the nav target:
	##if player: 
		##nav_agent.set_target_position(player.global_transform.origin)
	#if aggro:
		#
		#
		#
	#pass
		
		

	
	
func _on_hitbox_range_body_entered(body: Player) -> void:
	can_attack = true
	player = body


func _on_hitbox_range_body_exited(body: Player) -> void:
	can_attack = false
	player = null
