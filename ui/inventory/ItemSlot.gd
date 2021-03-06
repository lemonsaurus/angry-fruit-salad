extends ColorRect

export var weapon_data: Resource
signal new_weapon_data(weapon_data)

func _ready():
	update_slot()

func get_drag_data(position):
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = $ItemTexture.texture
	drag_texture.rect_size = Vector2(64.0, 64.0)
	
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	return self
	
func can_drop_data(position, data):
	if weapon_data == null:
		return true
	if !Fusion.fusion_dict.has(data.weapon_data.id):
		return false
	return Fusion.fusion_dict[data.weapon_data.id].has(weapon_data.id)
	
func drop_data(position, data):
	if self == data:
		return
	if weapon_data == null:
		var new_weapon_data = data.weapon_data
		data.weapon_data = weapon_data
		weapon_data = new_weapon_data
	else:
		var new_weapon_data = data.weapon_data
		data.weapon_data = null
		
		var fusion_weapon_id = Fusion.fusion_dict[new_weapon_data.id][weapon_data.id]
		weapon_data = Fusion.weapon_dict[fusion_weapon_id].duplicate()
		
	update_slot()
	data.update_slot()

func update_slot():
	emit_signal("new_weapon_data", weapon_data)
	if weapon_data:
		$ItemTexture.texture = weapon_data.texture
	else:
		$ItemTexture.texture = null
