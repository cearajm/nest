extends Panel


@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label
@onready var options =  $item_options
var player = null

var slot_item = null

func _ready():
	options.visible = false

func update(slot:InvSlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		print(slot.item.name)
		slot_item = slot
		if slot.amount > 1:
			amount_text.visible = true
			amount_text.text = str(slot.amount)
		elif slot.amount == 1:
			amount_text.visible = false
		else:
			item_visual.visible = false
			slot_item = null

func _on_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("right_click") and slot_item:
		options.position = event.position
		options.visible = true
		
func _on_use_pressed() -> void:
	if !player:
		player = get_tree().get_first_node_in_group("player").get_node("health")
	player.heal(20)
	slot_item.amount -= 1
	print(slot_item.amount)
	self.update(slot_item)
	options.visible = false
