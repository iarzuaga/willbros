extends RichTextLabel

export var score_p1 = 0

func _process(delta):
	score_p1 = get_node("../truck").score
	set_text(str(score_p1))


