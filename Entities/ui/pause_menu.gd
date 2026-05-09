extends Control

@onready var main = $"."
@onready var pause_menu = $PanelContainer
@onready var scene_select_menu = $"Scene Select"

signal restart

func _ready():
	main.hide()
	scene_select_menu.hide()
	pause_menu.hide()
	get_tree().paused = false
	
	# hide pause menu when changing scenes
	scene_select_menu.inventory_scene.connect(resume)
	scene_select_menu.temple_scene.connect(resume)
	scene_select_menu.combat_scene.connect(resume)
	scene_select_menu.water_scene.connect(resume)

func resume():
	get_tree().paused = false
	main.hide()
	pause_menu.hide()
	scene_select_menu.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func pause():
	get_tree().paused = true
	main.show()
	pause_menu.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("esc"):
		if get_tree().paused == false:
			pause()
		else:
			resume()
			
func _on_resume_pressed() -> void:
	resume()

func _on_change_scene_pressed() -> void:
	pause_menu.hide()
	scene_select_menu.show()
	
func _on_restart_pressed() -> void:
	restart.emit()
	resume()

func _on_quit_pressed() -> void:
	get_tree().quit()
