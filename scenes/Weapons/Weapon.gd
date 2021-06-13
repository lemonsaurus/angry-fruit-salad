extends Node2D

export var projectile_type:PackedScene
onready var anim_player = $WeaponArt/AnimationPlayer
onready var shot_delay = $shot_delay

func shoot(direction):
	
	#Spawn projectile and configure direction/rotation
	if shot_delay.time_left == 0:
		$AudioStreamPlayer.play()
		var proj = projectile_type.instance()
		proj.velocity = Vector2.RIGHT.rotated(direction+get_parent().rotation)
		get_tree().current_scene.add_child(proj)
		proj.global_position = $Muzzle.global_position
		proj.rotation = proj.velocity.angle()
		shot_delay.start()
	
