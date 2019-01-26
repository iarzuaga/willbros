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
		var object_person_collision = self.get_slide_collision(get_slide_count()-1)
		if object_person_collision:
			var brother_full = object_person_collision.get_collider_shape().get_parent()
			if  brother_full.is_in_group("brother"):
				if brother_full.object_grabbed:
					print("object attack when full")
				else:
					print("object attack while free")
					
			
		self.move_and_slide(velocity)
