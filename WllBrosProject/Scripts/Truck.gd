extends KinematicBody2D

onready var point_label = get_node("../points")
var score = 0

func _process(delta):
	var area = $drop_area
	var obj = area.get_overlapping_bodies()
	
	if obj:
		print(obj[0])
		if obj[0].is_in_group("object"):
			var value = obj[0].value
			score += value
			point_label.set_score(score)
			obj[0].get_parent().remove_child(obj[0])