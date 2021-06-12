extends Node2D

export var projectile_type:PackedScene
onready var anim_player = $WeaponArt/AnimationPlayer

func shoot(direction):
	#Spawn projectile and configure direction/rotation
	var proj = projectile_type.instance()
	proj.velocity = Vector2.RIGHT.rotated(direction+get_parent().rotation)
	get_tree().current_scene.add_child(proj)
	proj.global_position = $Muzzle.global_position
	proj.rotation = proj.velocity.angle()
	
