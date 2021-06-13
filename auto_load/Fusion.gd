extends Node

var available_fusion = [
	# Tier 1
	[WeaponData.ID.LASER_BANANA, WeaponData.ID.LASER_BANANA, WeaponData.ID.SUPER_BANANA],
	[WeaponData.ID.LASER_BANANA, WeaponData.ID.GRAPESHOT, WeaponData.ID.BANANASHOT],
	[WeaponData.ID.PINETHROWER, WeaponData.ID.PINETHROWER, WeaponData.ID.ANANAS],
	[WeaponData.ID.PINETHROWER, WeaponData.ID.PINETHROWER, WeaponData.ID.ANANAS]
	
	# Tier 2
]

var weapons_data = [
	load("res://resources/weapon_1.tres"),
	load("res://resources/weapon_2.tres"),
	load("res://resources/weapon_3.tres")
]

var weapon_dict = {}
var fusion_dict = {}

func _ready():
	build_weapon_dict()
	build_fusion_dict()

func build_weapon_dict():
	for weapon in weapons_data:
		weapon_dict[weapon.id] = weapon

func build_fusion_dict():
	for fusion in available_fusion:
		for i in range(2):
			if !fusion_dict.has(fusion[i]):
				fusion_dict[fusion[i]] = {}
			var other = 1 if i == 0 else 0
			fusion_dict[fusion[i]][fusion[other]] = fusion[2]
