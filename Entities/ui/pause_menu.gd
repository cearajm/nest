extends CanvasLayer

@onready var main = $"."
@onready var pause_menu = $PauseMenu
@onready var scene_select_menu = $SceneSelect

signal restart

func _ready():
	# show the main layer and hide the rest
	scene_select_menu.hide()

	## hide pause menu when changing scenes
	scene_select_menu.inventory_scene.connect(resume)
	scene_select_menu.temple_scene.connect(resume)
	scene_select_menu.combat_scene.connect(resume)
	scene_select_menu.water_scene.connect(resume)
	

func _input(event) -> void:
	if Input.is_action_just_pressed("esc"):
		resume()


func resume():
	# toggle menu layer visibility
	main.hide()
	pause_menu.show()
	scene_select_menu.hide()
	
	get_viewport().set_input_as_handled()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

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
