extends KinematicBody2D

export var value = 0
export var object_name = ""
export var object_weight = 0

var acceleration = Vector2(0,0)
var velocity = Vector2(0,0)

func _ready():
	pass

func _process(delta):
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
