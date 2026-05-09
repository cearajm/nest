extends State


@export var follow_state : State

@onready var player = get_tree().get_first_node_in_group("player").get_node("health")
@onready var enemy = %Enemy
@onready var timer = %Timer
@onready var animations = $"../../nest temp/AnimationPlayer"
var timer_on = false

	
func attack():
	player.take_damage(enemy.damage_amount)
	animations.play("slash")
	#player.set_is_hit(true)
	
func is_timer():
	return timer_on
	
#func _on_timer_timeout() -> void:
	#if player.is_vulnerable():
		#attack()
		#print("attacking")
	
func process_physics(delta) -> State:
	if player.is_vulnerable():
		if !timer_on:
			timer.timeout.connect(attack)
		timer_on = true
	else:
		if timer_on:
			timer.timeout.disconnect(attack)
			timer_on = false
		return follow_state
	return null
