extends Node

export var press1 = false
export var press2 = false

func _process(delta):
	
	if Input.is_action_just_pressed("Attack_2"):
		press1 = true
		
	elif Input.is_action_just_pressed("Attack"):
		 press2 = true
	
	elif press1 and press2:
		 get_tree().change_scene_to("game_manager")
		
	
	pass


