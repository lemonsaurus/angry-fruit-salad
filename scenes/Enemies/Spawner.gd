extends Node2D

var Enemy = preload("res://scenes/Enemies/enemy.tscn")


func _on_Timer_timeout():
	var enemy = Enemy.instance()
	get_tree().current_scene.add_child(enemy)
	enemy.global_position = global_position
	
