extends Control

# This script handles the signals for clicking the scene selection buttons.
# The signals are received in main.gd, where the actual scene logic is handled

signal inventory_scene
signal temple_scene
signal combat_scene
signal water_scene
signal forest_scene

func _on_inventory_pressed() -> void:
	print("inventory scene")
	inventory_scene.emit()


func _on_temple_pressed() -> void:
	print("temple scene")
	temple_scene.emit()


func _on_combat_pressed() -> void:
	print("combat scene")
	combat_scene.emit()


func _on_water_pressed() -> void:
	print("water scene")
	water_scene.emit()


func _on_forest_pressed() -> void:
	print("forest scene")
	forest_scene.emit()
	
	
	
	
