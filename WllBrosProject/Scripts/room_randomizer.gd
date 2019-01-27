extends Node

var room_list = []

onready var room_types = [
	preload("res://Scenes/Rooms/red.tscn"),
	preload("res://Scenes/Rooms/blue.tscn"),
	preload("res://Scenes/Rooms/base.tscn"),
	preload("res://Scenes/Rooms/bedroom.tscn")
]

onready var rooms = [
	get_node("room_1"),
	get_node("room_2"),
	get_node("room_3"),
	get_node("room_4")
]

func _ready():
	pass

func used(index):
	for room in room_list:
		if room == index:
			return true
		
	return false
	
func randomize():
	room_list = []
	
	for parent in rooms:
		for n in parent.get_children():
			parent.remove_child(n)
			
		var index = int(randf() * 4)
		
		while used(index):
			index = int(randf() * 4)
		
		room_list.append(index)
		
		var node = room_types[index].instance()
		parent.add_child(node)
		
		node.position = Vector2(0, 0)