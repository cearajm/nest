extends Node3D

var dialogue = load("res://characters/vagabond.dialogue")
var dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue, "start")

var can_interact = false
var player = null

func _ready():
	DialogueManager.dialogue_ended.connect(toggle_move)
	DialogueManager.dialogue_started.connect(toggle_move)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("f") and can_interact:
		DialogueManager.show_dialogue_balloon(dialogue, "start")
		

func toggle_move(_resource: DialogueResource):
	if !player:
		player = get_tree().get_first_node_in_group("player")
	player.toggle_move()
	if can_interact:
		can_interact = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		can_interact = true
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_area_3d_body_entered(_body: Node3D) -> void:
	can_interact = true
		
func _on_area_3d_body_exited(_body: Node3D) -> void:
	can_interact = false
