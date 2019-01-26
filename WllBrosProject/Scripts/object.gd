extends KinematicBody2D

export var value = 0
export var object_name = ""
export var object_weight = 0

var acceleration = Vector2(0,0)
var velocity = Vector2(0,0)

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

func _physics_process(delta):
	var deceleration = Vector2()
	if acceleration:
		velocity = acceleration
		acceleration = Vector2(0,0)
	if velocity:
		if velocity.y != 0:
			deceleration.y = velocity.y * delta * 2
		if velocity.x != 0:
			deceleration.x = velocity.x * delta * 2
		velocity = velocity - deceleration
		self.move_and_slide(velocity)
		pass
	pass
