extends Node2D

onready var weapon_holders = $Weapons.get_children()
var weapon_slots = {}

func _ready():
	#Store available weapon slots in a dict
	for i in weapon_holders.size():
		weapon_slots[i] = weapon_holders[i].get_children()
		if not weapon_slots[i]:
			weapon_slots[i] = null
		
	#Connect to events from UI	
	Events.connect("equip_weapon", self, "add_weapon")
	Events.connect("unequip_weapon", self, "remove_weapon")
	

func _process(delta):
	#If fire button is pressed, all weapons fire
	if Input.is_action_just_pressed("fire"):
		for weapon in weapon_slots.keys():
			if weapon_slots[weapon] != null:
				weapon_slots[weapon].shoot(get_parent().rotation)
		
func remove_weapon(slot):
	#Remove weapon from scene and set to null in dict
	if weapon_slots[slot] != null:
		weapon_slots[slot].queue_free()
	weapon_slots[slot] = null

func add_weapon(slot, weapon):
	#Add weapon to slot and update dict
	if weapon_slots[slot] != null:
		remove_weapon(slot)
	var wpn = weapon.node.instance()
	weapon_holders[slot].add_child(wpn)
	weapon_slots[slot] = wpn
	
	
