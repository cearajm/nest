extends StateNew

var damage_amount: float = 10
var enemy_attacked: CharacterBody3D

func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	# name _input with underscore -- is called regardless of current State
	if event.is_action_pressed("left_click"):
		parent.animations.play("slash_fast")
		#emit_signal("attack", damage_amount)
		if enemy_attacked:
			print('exists')
			enemy_attacked.health.take_damage(damage_amount)




# additions:
# attack animations, attack types
# hurt state
# resting and sitting
# idle


func _on_area_3d_body_entered(body: Node3D) -> void:
	body.in_range = true
	enemy_attacked = body
	#print('in range: ', body.in_range)
	#emit_signal('attack', damage_amount)


func _on_area_3d_body_exited(body: Node3D) -> void:
	body.in_range = false
	enemy_attacked = null
	#print('in range: ', body.in_range)
