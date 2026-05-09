extends Node

@onready var player = get_tree().get_first_node_in_group("player").get_node("health")
@export var enemy : Enemy

	
func attack():
	player.take_damage(enemy.damage_amount)
	#player.set_is_hit(true)
	

func _on_timer_timeout() -> void:
	if player.is_vulnerable():
		attack()
