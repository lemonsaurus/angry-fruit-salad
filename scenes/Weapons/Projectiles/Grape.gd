extends "res://scenes/Weapons/Projectiles/Projectile.gd"


var proj_speed = rand_range(450, 550)

func _process(delta):
	position += proj_speed * velocity * delta
