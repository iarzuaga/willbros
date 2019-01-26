extends KinematicBody2D

export var velocity = Vector2()
export var speed = 1800

export var grab_distance = 50
export var drop_distance = 60
export var throw_force = 500
export var play_two = false

onready var vel_i = Vector2(0, 0)
onready var object_grabbed = [] 
onready var direction = Vector2(0, 1)
onready var grab_zone = $pick_area
onready var attack_vel = Vector2(0, 0)

func _ready():
	pass
 
func _physics_process(delta):
	vel_i = Vector2(0,0)
	velocity = Vector2(0, 0)
	
	if not play_two:
	
		if Input.is_action_pressed("up"):
			vel_i.y -=1
			
			
		if Input.is_action_pressed("down"):
			vel_i.y +=1
			
			
		if Input.is_action_pressed("left"):
			vel_i.x -=1
			
			
		if Input.is_action_pressed("right"):
			vel_i.x +=1
	else:
		if Input.is_action_pressed("up_2"):
			vel_i.y -=1
			
			
		if Input.is_action_pressed("down_2"):
			vel_i.y +=1
			
			
		if Input.is_action_pressed("left_2"):
			vel_i.x -=1
			
			
		if Input.is_action_pressed("right_2"):
			vel_i.x +=1
	
	grab_zone.look_at(self.position)
	
	if vel_i != Vector2(0,0):
		direction = vel_i.normalized()
		grab_zone.position = direction * grab_distance		
		
	vel_i = speed * vel_i.normalized()
	
	if play_two:
		if Input.is_action_just_pressed("Interact_2"):
			interact(object_grabbed)
	else:
		if Input.is_action_just_pressed("Interact"):
			interact(object_grabbed)
		

	if play_two:
		if Input.is_action_just_pressed("Attack_2"):
			attack()
	else:
		if Input.is_action_just_pressed("Attack"):
			attack()
			
	velocity.x = lerp(velocity.x, vel_i.x, 0.1)
	velocity.y = lerp(velocity.y, vel_i.y, 0.1)
	move_and_slide(velocity, Vector2(0,0), 25.0)
	
func interact(object_grabbed):
	if object_grabbed:
		object_grabbed[0].position = direction * drop_distance + self.position
		self.get_parent().add_child(object_grabbed[0])
		
		if vel_i:
			object_grabbed[0].acceleration = direction * throw_force
			pass
		
		object_grabbed.remove(0)
		
	else:
		if grab_zone.get_overlapping_bodies():
			var object = grab_zone.get_overlapping_bodies()[0]
			object_grabbed.append(object)
			object.get_parent().remove_child(object)
			
func attack():
	attack_vel = speed * 0.10 * vel_i.normalized()
	var attack_action = move_and_collide(attack_vel)
	if attack_action:
		var brother_full = attack_action.get_collider_shape().get_parent()
		if brother_full.object_grabbed:
			brother_full.interact(brother_full.object_grabbed)

		