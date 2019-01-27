extends KinematicBody2D

export var value = 0
export var object_name = ""
export var object_weight = 0

export var change_collider = false
export var invert_h = false
export var sprite_direction = 1
"""
	0 - up
	1 - right
	2 - down
	3 - left
"""

var current_collider = null
var collider_disabled = false
var acceleration = Vector2(0,0)
var velocity = Vector2(0,0)
var direction = Vector2(1,0)

var old_sprite_direction = -1

func _ready():
	if change_collider:
		if $col_0: $col_0.disabled = true
		if $col_1: $col_1.disabled = true
		if $col_2: $col_2.disabled = true
		if $col_3: $col_3.disabled = true
	
	if $tmp_sprite:
		self.remove_child($tmp_sprite)

func set_collider(col):
	if change_collider:
		if $col_0: $col_0.disabled = true
		if $col_1: $col_1.disabled = true
		if $col_2: $col_2.disabled = true
		if $col_3: $col_3.disabled = true
		col.disabled = false
		current_collider = col

func disable_collider(state):
	collider_disabled = state

func _process(delta):
	if sprite_direction != old_sprite_direction:
		if invert_h:
			$sprite.flip_h = false
		else:
			$sprite.flip_h = true
				
		if sprite_direction == 3:
			sprite_direction = 1
			
			if invert_h:
				$sprite.flip_h = true
			else:
				$sprite.flip_h = false
		
		if sprite_direction == 0:
			$sprite.frame = 2
			if $col_0: set_collider($col_0)
		
		elif sprite_direction == 1:
			$sprite.frame = 1
			if $col_1: set_collider($col_1)
		
		elif sprite_direction == 2:
			$sprite.frame = 0
			if $col_2: set_collider($col_2)
	
	if current_collider:
		current_collider.disabled = collider_disabled
		
		

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
					brother_full.move_and_slide(velocity)
					self.direction = deceleration.normalized()
					brother_full.interact(brother_full.object_grabbed, self)
				else:
					brother_full.move_and_slide(velocity)
					brother_full.stun = 2
					
		self.move_and_slide(velocity)
