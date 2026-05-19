extends Node3D

@export var current_scene_packed : PackedScene
var current_scene_id : String = "main_scene"
var new_scene_id : String
@onready var current_scene_node = self.get_child(0)
@onready var pause_menu = $pause_menu
@onready var scene_select = $pause_menu.get_node("SceneSelect")
var new_scene_packed : PackedScene

@onready var forest_scene = "res://Scenes/forest.tscn"


func _ready():
	pause_menu.hide()
	
	scene_select.inventory_scene.connect(set_scene_inventory)
	scene_select.temple_scene.connect(set_scene_temple)
	scene_select.combat_scene.connect(set_scene_combat)
	scene_select.water_scene.connect(set_scene_water)
	scene_select.forest_scene.connect(set_scene_forest)
	pause_menu.restart.connect(restart)
	
func _input(event: InputEvent) -> void:
	# pause the game and show menu
	if event.is_action_pressed("esc"):
		get_tree().paused = true
		pause_menu.show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	
	
func restart():
	var scene_copy = current_scene_packed.instantiate()
	remove_child(current_scene_node)
	add_child(scene_copy)
	move_child(scene_copy, 0)
	current_scene_node = scene_copy
	
func set_scene_inventory():
	new_scene_packed = load("res://Scenes/inventory_test.tscn")
	new_scene_id = "inventory_scene"
	switch_scene(new_scene_packed)
	
func set_scene_temple():
	new_scene_packed = load("res://Scenes/temple_test.tscn")
	new_scene_id = "temple_scene"
	switch_scene(new_scene_packed)
	
func set_scene_combat():
	#new_scene_packed = load("res://Scenes/combat_test.tscn")
	new_scene_packed = load("res://Scenes/new_tests.tscn")
	new_scene_id = "combat_scene"
	switch_scene(new_scene_packed)
	
func set_scene_water():
	new_scene_packed = load("res://Scenes/water_test.tscn")
	switch_scene(new_scene_packed)
	
func set_scene_forest():
	new_scene_packed = load(forest_scene)
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
	
