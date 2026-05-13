extends Node2D

@onready var item_container: Node = %item_container


func _ready() -> void:
	self.hide()
	
	
func add_item(object) -> void:
	item_container.add_child(object)
	item_container.item = object
	print("added", object.name)
	object.position = Vector3.ZERO
	print(object.position)
	print(object.global_position)
	
