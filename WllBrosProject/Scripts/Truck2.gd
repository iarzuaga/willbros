extends KinematicBody2D

var score = 0

func _process(delta):
	var area = $drop_area
	var obj = area.get_overlapping_bodies()
	
	if obj:
		print(obj[0])
		if obj[0].is_in_group("object") or true:
		  var value = obj[0].value
		  score += value
		  obj[0].get_parent().remove_child(obj[0])
		  $points.set_score(score)