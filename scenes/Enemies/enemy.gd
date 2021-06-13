extends KinematicBody2D

onready var Pepperoni = preload("res://scenes/Enemies/Pepperoni Bullet.tscn")
onready var map_nav = get_parent().get_node("Navigation2D")

var player = null
var velocity = Vector2.ZERO
var path_to_dest = []
var direction = null
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
		var enemy_pos = get_global_position()
		match direction:
			0: enemy_pos.x += 1
			1: enemy_pos.x -= 1
			2: enemy_pos.y += 1
			3: enemy_pos.y -= 1
			_: enemy_pos.x += 1

		move = position.direction_to(enemy_pos)

	velocity = move.normalized()
	if velocity != Vector2.ZERO:
		velocity = move_and_slide(velocity*speed)


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player = body


func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
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


func _on_Change_Direction_timeout():
	direction = randi() % 4
