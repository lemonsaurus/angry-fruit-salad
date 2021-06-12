extends KinematicBody2D

onready var Pepperoni = preload("res://scenes/Enemies/Pepperoni Bullet.tscn")

var player = null
var velocity = Vector2.ZERO
export var speed = 150


func _physics_process(delta):
	var move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position)
	else:
		move = Vector2.ZERO
		
	velocity = (move).normalized()
	velocity = move_and_slide(velocity*speed)


func _on_Area2D_body_entered(body):
	if body != self:
		player = body


func _on_Area2D_body_exited(body):
	player = null


func fire():
	var pepperoni = Pepperoni.instance()
	pepperoni.position = get_global_position()
	pepperoni.player = player
	get_parent().add_child(pepperoni)
	$Timer.set_wait_time(1)


func _on_Timer_timeout():
	if player != null:
		fire()
