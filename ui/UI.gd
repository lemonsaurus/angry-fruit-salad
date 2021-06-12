extends Control


func _ready():
	Events.connect("equip_weapon", self, "test_equip")
	Events.connect("unequip_weapon", self, "test_unequip")
	
func test_equip(weapon_slot, weapon_data):
	print("Equiped weapon at slot ", weapon_slot, " with: ", weapon_data.name, weapon_data)
	
func test_unequip(weapon_slot):
	print("Unequiped weapon at slot ", weapon_slot)	
