extends Area2D

var velocity = Vector2.ZERO
export var destroy_effect:PackedScene


func _on_Projectile_body_entered(body):
	if body.is_in_group('enemy'):
		body.queue_free()
	if destroy_effect != null:
		var effect = destroy_effect.instance()
		get_tree().current_scene.add_child(effect)
		effect.position = position
	queue_free()
