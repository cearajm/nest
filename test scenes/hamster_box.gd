extends CSGBox3D


@export var item: InvItem

var player_in_area = false	
var player = null


func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("e"):
		player.collect(item)

func _on_area_3d_body_entered(body: Node3D) -> void:
	player_in_area = true
	player = body
	

func _on_area_3d_body_exited(_body: Node3D) -> void:
	player_in_area = false
