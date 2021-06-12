extends Node

signal equip_weapon(weapon_slot, weapon_resource)
signal unequip_weapon(weapon_slot)

var player = null

func set_player(p):
	player = p
