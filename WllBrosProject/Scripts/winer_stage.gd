extends Node

var load_time = 2
var option = ""
var can_select = true



func _process(delta):
	
	if (Input.is_action_just_pressed("Interact") or Input.is_action_just_pressed("Interact_2")) and can_select or option == "new_game":
		
		if load_time <= 0 :
			get_tree().change_scene("res://Scenes/game_manager.tscn")
		else:
			load_time -= delta
	
		can_select = false
		option = "new_game"

	if (Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Attack_2")) and can_select or option == "main_menu":
		
		if load_time <= 0 :
			get_tree().change_scene("res://Scenes/Menu.tscn")
		else:
			load_time -= delta
			
		can_select = false
		option = "main_menu"


#@param score int (puntos dentro de truck al final del tiempo)
#@param score1 int (puntos dentro de truck2 al final del tiempo)
#@param objects array (todos los objetos que entraron en el camion del ganador)

