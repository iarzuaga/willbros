extends KinematicBody2D


var score = 0

func _process(delta):
	var area = $drop_area
	var caca = area.get_overlapping_bodies()
	
	for obj in caca:
		if obj.is_in_group("object"):
			var value = obj.value
			score += value
			obj.get_parent().remove_child(obj)
			$points.set_score(score)
			if self.name == "truck":
				global.player_red_points = score
				global.player_red_item += [obj.name]
			elif self.name == "truck2":
				global.player_blue_points = score
				global.player_blue_item += [obj.name]
	