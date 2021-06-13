extends KinematicBody2D


var turn_speed = 9
var max_move_speed = 250
var acceleration = .3
var friction = 0.1
var velocity = Vector2.ZERO
onready var debug_line = $debug_line

func _ready():
	
	#Connect to UI events
	Events.connect("equip_weapon", self, "weapon_added")
	Events.connect("unequip_weapon", self, "weapon_removed")
	
	#Tell the game who the player is (so other's can reference)
	yield(get_tree(), 'idle_frame')
	Events.set_player(self)
	

func weapon_added(_slot, _weapon):
	#When a weapon is added, lower max speed and acceleration
	acceleration-=.055
	max_move_speed -= 30
	
func weapon_removed(_slot):
	#When a weapon is removed, increase max speed and acceleration
	acceleration+=.1
	max_move_speed += 50

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
		$GunMount.look_at(get_global_mouse_position())
	
	update_facing(direction)
		
	velocity = move_and_slide(velocity)
	
func update_facing(direction):
	
	var p_sprite = $Sprite
	#moving right
	if direction.x > 0:
		p_sprite.frame = 1
	#moving left
	elif direction.x < 0:
		p_sprite.frame = 3
	#moving up
	elif direction.y < 0:
		p_sprite.frame = 2
	#moving down
	elif direction.y > 0:
		p_sprite.frame = 0
	
