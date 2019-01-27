extends Node

var load_time = 2
var started = false

func _process(delta):
	
	if Input.is_action_just_pressed("Interact") or Input.is_action_just_pressed("Interact_2") or started:
		started = true
		
		if load_time <= 0 :
			get_tree().change_scene("res://Scenes/game_manager.tscn")
			
		else:
			load_time = load_time - delta 
	pass

