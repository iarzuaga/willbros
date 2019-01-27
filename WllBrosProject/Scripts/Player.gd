extends KinematicBody2D

export var speed = 1800

export var grab_distance = 50
export var drop_distance = Vector2(60, 50)
export var lift_offset = Vector2(0, -94)
export var throw_force = 500
export var play_two = false
export var stun = 0

export var attack_coldown = 2
export var throw_coldown = 3
export var jump_coldown = 2
export var stun_duration = 2

onready var vel_i = Vector2(0, 0)
onready var object_grabbed = [] 
onready var direction = Vector2(0, 1)
onready var grab_zone = $pick_area
onready var attack_vel = Vector2(0, 0)
onready var object_parent = get_node("../object_master")

var velocity = Vector2(0, 0)
var jump_stun = 0
var throw_stun = 0

func _ready():
	pass
 
func _physics_process(delta):
	if stun:
		stun -= delta
		if  stun < 0:
			stun = 0
	if jump_stun:
		jump_stun -= delta
		if  jump_stun < 0:
			jump_stun = 0
	if throw_stun:
		throw_stun -= delta
		if  throw_stun < 0:
			throw_stun = 0

	vel_i = Vector2(0,0)
	velocity = Vector2(0, 0)
	
	if not stun:
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
	
	if not stun:
		if play_two:
			if Input.is_action_just_pressed("Interact_2"):
				interact(object_grabbed, null)
		else:
			if Input.is_action_just_pressed("Interact"):
				interact(object_grabbed, null)
		
	if not stun:
		if play_two:
			if Input.is_action_just_pressed("Attack_2"):
				if not self.jump_stun:
					attack()
					jump_stun = jump_coldown
		else:
			if Input.is_action_just_pressed("Attack"):
				if not self.jump_stun:
					attack()
					jump_stun = jump_coldown
			
	velocity.x = lerp(velocity.x, vel_i.x, 0.1)
	velocity.y = lerp(velocity.y, vel_i.y, 0.1)
	move_and_slide(velocity, Vector2(0,0), 25.0)
	
func interact(object_grabbed, attacked):
	var interact_position
	if object_grabbed:
		if attacked:
			interact_position = attacked.position
			direction = attacked.direction
			
			#self.get_parent().add_child(object_grabbed[0])
			change_parent(object_grabbed[0], self, object_parent)
			object_grabbed[0].get_node("collider").disabled = false
			
			self.stun = stun_duration
			object_grabbed[0].position = direction * drop_distance.x + interact_position
			object_grabbed[0].acceleration = direction * throw_force
			object_grabbed[0].remove(0)
		
		elif not throw_stun:
			interact_position = self.position
			
			#self.get_parent().add_child(object_grabbed[0])
			change_parent(object_grabbed[0], self, object_parent)
			object_grabbed[0].get_node("col_1").disabled = false
			
			object_grabbed[0].position = direction * drop_distance.x + interact_position
			object_grabbed[0].acceleration = direction * throw_force
			object_grabbed.remove(0)
			
			self.throw_stun = throw_coldown
		
	else:
		if grab_zone.get_overlapping_bodies():
			var bodies = grab_zone.get_overlapping_bodies()
			
			for object in bodies:
				if object.is_in_group("object"):
					object_grabbed.append(object)
					object_grabbed[0].position = lift_offset
					object_grabbed[0].velocity = Vector2(0, 0)
					object_grabbed[0].get_node("col_1").disabled = true
					change_parent(object_grabbed[0], object_grabbed[0].get_parent(), self)
					break

func attack():
	if not self.object_grabbed:
		attack_vel = speed * 0.05 * vel_i.normalized()
		var attack_action = move_and_collide(attack_vel)
		if attack_action:
			var brother_full = attack_action.get_collider_shape().get_parent()
			if  brother_full.is_in_group("brother") and brother_full.object_grabbed:
				brother_full.move_and_slide(attack_vel)
				brother_full.interact(brother_full.object_grabbed, self)

func change_parent(node, src, dest):
	src.remove_child(node)
	dest.add_child(node)