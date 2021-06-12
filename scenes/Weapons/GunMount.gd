extends Node2D

onready var weapon_holders = $Weapons.get_children()
var weapon_slots = {}

func _ready():
	#Store available weapon slots in a dict
	for i in weapon_holders.size():
		weapon_slots[i] = weapon_holders[i].get_children()
		if not weapon_slots[i]:
			weapon_slots[i] = null
		
func remove_weapon(slot):
	#Remove weapon from scene and set to null in dict
	if weapon_slots[slot] != null:
		weapon_slots[slot].queue_free()
	weapon_slots[slot] = null

func add_weapon(slot, weapon):
	#Add weapon to slot and update dict
	var wpn = weapon.instance()
	weapon_holders[slot].add_child(wpn)
	weapon_slots[slot] = wpn
	
	
