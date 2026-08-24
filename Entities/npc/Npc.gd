extends CharacterBody3D
class_name Npc

@onready var interaction_area: InteractionArea = $InteractionArea

var dialogue = load("res://Entities/vagabond/vagabond.dialogue")
var dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue, 'start')
var dialogue_active = false


func _ready() -> void:
	# connect to interacted signal instead of DialogueManager.dialogue_started
	# because the collision area already takes care of interaction input
	interaction_area.interacted.connect(start_interaction)
	DialogueManager.dialogue_ended.connect(end_interaction)
	

func start_interaction() -> void:
	if !dialogue_active:
		dialogue_active = true
		DialogueManager.show_dialogue_balloon(dialogue, 'start')
	
	
func end_interaction(_resource: DialogueResource) -> void:
	dialogue_active = false
	#print('ended')
	
