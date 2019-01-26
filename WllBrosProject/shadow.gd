extends Area2D

var in_area = false
var fade_duration = 2

func _process(delta):
	in_area = false
	var obj_list = self.get_overlapping_bodies()
	
	for obj in obj_list:
		if obj.is_in_group("player"):
			in_area = true
		
	fade_update(delta)
		
func fade_update(delta):
	if in_area and $sprite.modulate.a >= 0:
		$sprite.modulate.a -= delta * fade_duration
		
	elif $sprite.modulate.a >= 0:
		$sprite.modulate.a += delta * fade_duration
	
	if $sprite.modulate.a != 0 or $sprite.modulate.a != 1:
		$sprite.modulate.a = clamp($sprite.modulate.a, 0, 1)