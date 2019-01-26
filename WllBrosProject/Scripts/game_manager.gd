extends Node

func _process(delta):
	if Input.is_action_pressed("close_game"):
		get_tree().exit()