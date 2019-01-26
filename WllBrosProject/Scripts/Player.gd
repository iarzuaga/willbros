extends KinematicBody2D

export var velocity = Vector2()
export var speed = 1800
export var vel_i = Vector2(0,0)
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
		
	if Input.is_action_pressed("rigth"):
		vel_i.x +=1
	
	vel_i = speed * vel_i.normalized()
	velocity.x = lerp(velocity.x, vel_i.x, 0.1)
	velocity.y = lerp(velocity.y, vel_i.y, 0.1)
	move_and_slide(velocity, Vector2(0,0), 25.0)
	