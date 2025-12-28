extends CharacterBody3D
class_name Player


## handles character physics and camera spring arm

@export var inventory: Inventory
@export var skin: Node3D
@export var animations: AnimationPlayer
@export var health: Health

@onready var state_machine = $state_machine

func _ready() -> void:
	state_machine.init(self)
 

func asdf():
	print('test')


# viewport dimensions
# 1152 x 648

#region refs -- audio, animation

	#@onready var footsteps_stone = $AudioStreamPlayer3D
	
	#if move_direction:
		#if is_on_floor():
			#if !footsteps_stone.playing:
				#footsteps_stone.pitch_scale = randf_range(0.5, 0.75)
				#footsteps_stone.play()
	#else:
		#footsteps_stone.stop()

		
	
	# $AnimationTree.set("parameters/conditions/idle", raw_input == Vector2.ZERO)
	# $AnimationTree.set("parameters/conditions/run", raw_input != Vector2.ZERO and can_move)
	# $AnimationTree.set("parameters/conditions/dance", dance)
	

	# give player location to enemies
	#get_tree().call_group("enemy", "update_target_location", self.global_transform.origin)  # get location once, update all enemy groups
#endregion
	
