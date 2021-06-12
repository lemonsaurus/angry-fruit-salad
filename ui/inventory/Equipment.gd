extends Control

func _ready():
	var i = 0
	for item_slot in $HBoxContainer.get_children():
		item_slot.connect("new_weapon_data", self, "weapon_changed", [i])
		i += 1
		
func weapon_changed(weapon_data, weapon_slot):
	if !weapon_data:
		Events.emit_signal("unequip_weapon", weapon_slot)
	else:
		Events.emit_signal("equip_weapon", weapon_slot, weapon_data)
