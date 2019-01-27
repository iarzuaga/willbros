extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var paused = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		print(paused)
		if not paused:
			pause_game()
			paused = !paused
		else:
			resume_game()
			paused = !paused


func pause_game():
    get_tree().paused = true
    ##$pause_popup.show()

func resume_game():
    ##$pause_popup.hide()
    get_tree().paused = false