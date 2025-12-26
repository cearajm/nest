extends EnemyNew

@onready var health = $health
@onready var state_machine = $state_machine
@onready var in_range: bool = false



func _ready() -> void:
	state_machine.init(self)
	
