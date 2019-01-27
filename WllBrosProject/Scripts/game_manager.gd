extends Node2D

onready var room_container = get_node("room_container")

func _process(delta):
	if Input.is_action_just_pressed("close_game"):
		reset()
		#get_tree().exit()

func reset():
	room_container.randomize()