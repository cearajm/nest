extends Health





#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed('left_click'):
		#if health_value > 0:
			#take_damage(damage_amount)
		#else:
			#die()
		

#func take_damage():
	#health_value -= damage_amount
	#health_bar.value = health_value
	#print(health_value)



#func die():
	#print('u died')
	#health_value = max_health
	#health_bar.value = health_value
