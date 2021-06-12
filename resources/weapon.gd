extends Resource
class_name WeaponData

export var name : String
export var tooltip : String
export var texture: Texture
export var node: PackedScene

enum ID {
	LASER_BANANA,
	GRAPESHOT,
	PINETHROWER,
	SUPER_BANANA,
	BANANASHOT,
	ANANAS
}

export(ID) var id

