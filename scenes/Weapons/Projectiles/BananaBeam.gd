extends "res://scenes/Weapons/Projectiles/Projectile.gd"


onready var beam_ray = $beam_ray

func _process(delta):
	if beam_ray.is_colliding():
		var col_distance = (beam_ray.get_collision_point() - global_position).length()
		$Sprite.region_rect = Rect2(0, 0, col_distance, 32)
		$CollisionShape2D.shape.length = col_distance
		var collision_objects = beam_ray.get_collider()
	


func _on_Projectile_body_entered(body):
	if body.is_in_group('enemy'):
		body.queue_free()
	if destroy_effect != null:
		var effect = destroy_effect.instance()
		get_tree().current_scene.add_child(effect)
		effect.position = position
