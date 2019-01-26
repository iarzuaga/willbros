extends RichTextLabel

var ns = 6
var second = 59
var minute = 2

func _process(delta):

	if ns < 0:
		second -= 1
		ns = 6
		
	if second < 0:
		minute -= 1
		second = 59
	
		
	if minute >= 0:
		set_text(str(minute)+":"+str(second))
	
	pass

	print (second)


func _on_second_timeout():
	ns -= 1
	pass
