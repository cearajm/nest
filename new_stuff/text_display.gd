extends SliceBalloon

#var slice_resource = load('res://new_stuff/dialogue/slice.dialogue')
var dialogue = load('res://new_stuff/dialogue/slice.dialogue')
#var dialogue_line = await DialogueManager.get_next_dialogue_line(resource, 'start')
# or
#var dialogue_line = await resource.get_next_dialogue_line('start')
#var balloon_scene: PackedScene = load("res://new_stuff/dialogue/balloon.tscn")   # balloon
var balloon_scene = load("res://new_stuff/dialogue/transparent_balloon.tscn")   # transparent_balloon

var dialogue_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.dialogue_started.connect(start_dialogue)
	DialogueManager.dialogue_ended.connect(end_dialogue)
	#next_action = 'f'
	#pass
	


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('e') and !dialogue_active:
		print(dialogue_active)
		DialogueManager.show_dialogue_balloon_scene(balloon_scene, dialogue, 'start')


func start_dialogue(_resource: DialogueResource):
	dialogue_active = true
	print("active")
	
func end_dialogue(_resource: DialogueResource):
	dialogue_active = false
	print('inactive')
