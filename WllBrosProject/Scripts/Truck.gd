extends KinematicBody2D


var score = 0

func _process(delta):
	var area = $drop_area
	var obj = area.get_overlapping_bodies()
	
	if obj:
		if obj[0].is_in_group("object"):
			var value = obj[0].value
			score += value
			obj[0].get_parent().remove_child(obj[0])
			$points.set_score(score)
			if self.name == "truck":
				global.player_red_points = score
				global.player_red_item += [obj[0].name]
			elif self.name == "truck2":
				global.player_blue_points = score
				global.player_blue_item += [obj[0].name]
	