extends AudioStreamPlayer


func _ready():
	self.play()
	self.set_loop(true)
	
func _process(delta):
	var pos = get_playback_position()
	if pos == 4.0:
		self.play(0.0)
			
