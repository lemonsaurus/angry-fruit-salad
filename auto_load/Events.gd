extends Node

signal equip_weapon(weapon_slot, weapon_resource)
signal unequip_weapon(weapon_slot)

var player = null

func set_player(p):
	player = p
	
func reload_scene():
	yield(get_tree().create_timer(2), 'timeout')
	get_tree().reload_current_scene()
