extends KinematicBody2D


var turn_speed = 9
var max_move_speed = 500
var acceleration = .1
var friction = 0.1
var velocity = Vector2.ZERO
onready var debug_line = $debug_line

func _physics_process(delta):
	#Set directional movement
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = direction.normalized()
	
	#Accelerate towards max speed if inputs, otherwise slowly come to stop
	if direction != Vector2.ZERO:
		velocity = lerp(velocity, direction*max_move_speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
		
		
	#Only update rotation if mouse is a certain distance from character
	if (get_global_mouse_position()-global_position).length() > 25:
		look_at(get_global_mouse_position())
		
	velocity = move_and_slide(velocity)
	
