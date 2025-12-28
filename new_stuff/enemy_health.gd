extends Health





#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed('left_click'):
		#if health_value > 0:
			#take_damage()
		#else:
			#die()
