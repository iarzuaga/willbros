extends KinematicBody2D

onready var point_label = get_node("../points")
var score = 0

func _process(delta):
	var area = $drop_area
	var obj_list = area.get_overlapping_bodies()
	
	for obj in obj_list:
		if obj.is_in_group("object"):
			var value = obj.value
			score += value
			point_label.set_score(score)
			obj.get_parent().remove_child(obj)