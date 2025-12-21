extends Control

signal inventory_scene
signal temple_scene
signal combat_scene
signal water_scene

func _on_inventory_pressed() -> void:
	inventory_scene.emit()


func _on_temple_pressed() -> void:
	temple_scene.emit()


func _on_combat_pressed() -> void:
	combat_scene.emit()


func _on_water_pressed() -> void:
	water_scene.emit()
