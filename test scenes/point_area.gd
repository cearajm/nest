extends Area3D

var in_area = false


func _on_body_entered(_body: Node3D) -> void:
	# print("entered")
	in_area = true


func _on_body_exited(_body: Node3D) -> void:
	# print("exited")
	in_area = false
	
func is_in_area():
	return in_area
