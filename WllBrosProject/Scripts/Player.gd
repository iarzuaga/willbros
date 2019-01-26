extends KinematicBody2D

export var velocity = Vector2()
export var speed = 1800
export var vel_i = Vector2(0,0)
onready var object_grabbed = [] 
func _ready():
	
	pass
	
func _physics_process(delta):
	vel_i = Vector2(0,0)
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("up"):
		vel_i.y -=1
		
	if Input.is_action_pressed("down"):
		vel_i.y +=1
		
	if Input.is_action_pressed("left"):
		vel_i.x -=1
		
	if Input.is_action_pressed("right"):
		vel_i.x +=1
	
	vel_i = speed * vel_i.normalized()
	
	if Input.is_action_just_pressed("Interact"):
		print(object_grabbed)
		var grab_zone = $pick_area
		if object_grabbed:
			if vel_i:
				##throw
				pass
			else:
				self.get_parent().add_child(object_grabbed[0])
				object_grabbed.remove(0)
		else:
			if grab_zone.get_overlapping_bodies():
				var object = grab_zone.get_overlapping_bodies()[0]
				object_grabbed.append(object)
				object.get_parent().remove_child(object)
	
	if Input.is_action_just_pressed("Attack"):
		vel_i = speed * 100 * vel_i.normalized()
		pass
	
	velocity.x = lerp(velocity.x, vel_i.x, 0.1)
	velocity.y = lerp(velocity.y, vel_i.y, 0.1)
	move_and_slide(velocity, Vector2(0,0), 25.0)
	
