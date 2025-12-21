extends Node3D

@export var current_scene_packed : PackedScene
var current_scene_id : String = "inventory_scene"
var new_scene_id : String
@onready var current_scene_node = self.get_child(0)
@onready var pause_menu = $pause_menu
@onready var scene_select = $pause_menu.get_node("Scene Select")
var new_scene_packed : PackedScene


func _ready():
	scene_select.inventory_scene.connect(set_scene_inventory)
	scene_select.temple_scene.connect(set_scene_temple)
	scene_select.combat_scene.connect(set_scene_combat)
	scene_select.water_scene.connect(set_scene_water)
	pause_menu.restart.connect(restart)
	
func restart():
	var scene_copy = current_scene_packed.instantiate()
	remove_child(current_scene_node)
	add_child(scene_copy)
	move_child(scene_copy, 0)
	current_scene_node = scene_copy
	
func set_scene_inventory():
	new_scene_packed = load("res://test scenes/inventory_test.tscn")
	new_scene_id = "inventory_scene"
	switch_scene(new_scene_packed)
	
func set_scene_temple():
	new_scene_packed = load("res://test scenes/temple_test.tscn")
	new_scene_id = "temple_scene"
	switch_scene(new_scene_packed)
	
func set_scene_combat():
	new_scene_packed = load("res://test scenes/combat_test.tscn")
	new_scene_id = "combat_scene"
	switch_scene(new_scene_packed)
	
func set_scene_water():
	new_scene_packed = load("res://test scenes/water_test.tscn")
	switch_scene(new_scene_packed)
	
	
func switch_scene(next_scene):
	if current_scene_packed == next_scene:
		print("u are already in that scene")
	else:
		var new_scene = next_scene.instantiate()
		remove_child(current_scene_node)
		add_child(new_scene)
		move_child(new_scene, 0)
		current_scene_node = new_scene
		current_scene_packed = next_scene
	
