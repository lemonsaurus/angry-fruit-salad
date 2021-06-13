extends KinematicBody2D

onready var Pepperoni = preload("res://scenes/Enemies/Pepperoni Bullet.tscn")
onready var map_nav = get_parent().get_node("TestMap2/Navigation2D")

var player = null
var velocity = Vector2.ZERO
var path_to_dest = []
export var speed = 200


func _physics_process(delta):
	var move = Vector2.ZERO
	if player != null:
		var enemy_pos = get_global_position()
		var destination = map_nav.get_closest_point(player.position)
		path_to_dest = map_nav.get_simple_path(enemy_pos, destination, false)

	if path_to_dest.size() > 1:
		move = position.direction_to(path_to_dest[1])  # first point is current position
	else:
		move = Vector2.ZERO

	velocity = move.normalized()
	velocity = move_and_slide(velocity*speed)
	update_facing(move)


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


func _on_Hurtbox_hurt():
	queue_free()
	
func update_facing(direction):
	var p_sprite = $Sprite
	if direction.y < 0:
		p_sprite.frame = 2
	#moving down
	elif direction.y > 0:
		p_sprite.frame = 0
	#moving right
	elif direction.x > 0:
		p_sprite.frame = 1
	#moving left
	elif direction.x < 0:
		p_sprite.frame = 3
	#moving up
