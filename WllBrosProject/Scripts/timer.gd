extends RichTextLabel

var second = 0
var minute = 3

func _process(delta):
	if second < 0:
		minute -= 1
		second = 59
	
	if minute >= 0:
		if second < 10 :
			set_text(str(minute)+":0"+str(second))
		else:
			set_text(str(minute)+":"+str(second))
	
	if second <= 0 and minute <= 0:
		get_tree().change_scene("res://Scenes/winer_stage.tscn")


func _on_second_timeout():
	second -= 1
