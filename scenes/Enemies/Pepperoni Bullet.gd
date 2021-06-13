extends Area2D

var move = Vector2.ZERO
var look_vector = Vector2.ZERO
var player = null
var speed = 5


func _ready():
	randomize()
	look_vector = player.position - global_position
	var rand_scale = rand_range(0.75, 1.25)
	scale = Vector2(rand_scale, rand_scale)
	
	
func _physics_process(delta):
	move = Vector2.ZERO
	move = move.move_toward(look_vector, delta)
	move = move.normalized() * speed
	position += move


func _on_Pepperoni_Bullet_body_entered(body):
	if body.name == 'Player':
		body.queue_free()
	queue_free()
