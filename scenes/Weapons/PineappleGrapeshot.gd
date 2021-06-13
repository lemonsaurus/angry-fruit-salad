extends "res://scenes/Weapons/Weapon.gd"


var number_projectiles = 8
var spread_factor = .5

func shoot(direction):
	if shot_delay.time_left != 0:
		return
	randomize()
	for i in range(number_projectiles):
		#Spawn projectile and configure direction/rotation
		var proj = projectile_type.instance()
		var shoot_offset = rand_range(-spread_factor, spread_factor)
		proj.velocity = Vector2.RIGHT.rotated(direction+get_parent().rotation+shoot_offset)
		get_tree().current_scene.add_child(proj)
		proj.global_position = $Muzzle.global_position
		proj.rotation = proj.velocity.angle()
		#yield(get_tree(), 'idle_frame')
	shot_delay.start()
