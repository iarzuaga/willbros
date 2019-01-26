extends RichTextLabel

var second = 59
var minute = 2

func _process(delta):
	if second < 0:
		minute -= 1
		second = 59
	
	if minute >= 0:
		set_text(str(minute)+":"+str(second))

func _on_second_timeout():
	second -= 1
