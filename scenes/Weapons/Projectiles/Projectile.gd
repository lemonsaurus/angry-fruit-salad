extends Area2D

var velocity = Vector2.ZERO
export var destroy_effect:PackedScene


func _on_Projectile_body_entered(body):
	destroy_effect()
	queue_free()


func _on_Hitbox_area_entered(area):
	area.emit_signal('hurt')
	destroy_effect()
	queue_free()
	
func destroy_effect():
	
	if destroy_effect != null:
		var effect = destroy_effect.instance()
		get_tree().current_scene.add_child(effect)
		effect.position = position
