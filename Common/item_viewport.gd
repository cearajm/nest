extends Node2D

@onready var item_container: Node = %item_container


func _ready() -> void:
	self.hide()
	
	
func add_item(object) -> void:
	# add object instance to the subviewport
	# position needs to be reset cus the duplicate object also copies world coords
	item_container.add_child(object)
	item_container.item = object
	object.position = Vector3.ZERO
	
	print("added ", object.name)
	
