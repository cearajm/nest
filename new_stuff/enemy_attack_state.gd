extends StateNew


@onready var player: Player
var can_attack: bool = false
var cooldown_timer: float



func _process(delta: float) -> void:
	if can_attack and player:
		attack(player)
		can_attack = false
		cooldown_timer = 1.5
		
	cooldown_timer -= delta
	if cooldown_timer < 0:
		can_attack = true
		
		
func attack(player):
	player.health.take_damage(5)
	parent.animations.play('slash_fast')
	
	
func _on_hitbox_range_body_entered(body: Player) -> void:
	can_attack = true
	player = body


func _on_hitbox_range_body_exited(body: Player) -> void:
	can_attack = false
	player = null
