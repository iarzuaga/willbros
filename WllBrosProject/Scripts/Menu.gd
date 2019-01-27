extends Node

export var press1 = false
export var press2 = false
var load_time = 1

func _process(delta):
	
	if Input.is_action_just_pressed("Interact"):
		press1 = true
		$CanvasLayer/red.visible = true
		
	elif Input.is_action_just_pressed("Interact_2"):
		 $CanvasLayer/blue.visible = true
		 press2 = true
		 
		 
	elif press1 == true and press2 == true:
		$CanvasLayer/go.visible = true
		if load_time <= 0 :
			get_tree().change_scene("res://Scenes/tuto.tscn")
			
		else:
			load_time -= delta


