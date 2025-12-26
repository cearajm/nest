extends StateNew

var damage_amount: float = 10
var enemy_attacked: CharacterBody3D

func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	# start _input with an underscore -- is called regardless of current State
	# attack on click and damage enemy
	if event.is_action_pressed("left_click"):
		parent.animations.play("slash_fast")
		if enemy_attacked:
			#print('exists')
			enemy_attacked.health.take_damage(damage_amount)


func _on_area_3d_body_entered(body: Node3D) -> void:
	# enemy is detected by player's collision area -- is vulnerable in this range
	body.in_range = true
	enemy_attacked = body   # get node that will take damage


func _on_area_3d_body_exited(body: Node3D) -> void:
	body.in_range = false
	enemy_attacked = null   # reset
