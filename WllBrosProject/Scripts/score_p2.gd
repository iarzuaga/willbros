extends RichTextLabel

export var score_p2 = 0

func _process(delta):
	score_p2 = get_node("../truck2").score
	set_text(str(score_p2))



