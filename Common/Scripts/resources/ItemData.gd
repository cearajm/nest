extends Resource
class_name ItemData
# Create .tres files of this type                                to store static data for each item

# These attributes will be editable in the inspector for each item
@export var display_name: String = "New Item"
@export var icon: Texture2D
@export var value: int = 1
@export var max_stack: int = 1
@export_multiline var description: String = ""
