extends "res://scenes/Weapons/Projectiles/Projectile.gd"

var proj_speed = 500

func _process(delta):
	position += proj_speed * velocity * delta
