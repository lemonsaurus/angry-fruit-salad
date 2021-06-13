extends StaticBody2D


func _ready():
	var cacti = $art.get_children()
	for i in cacti:
		i.visible = false
	cacti [randi() % cacti.size()].visible = true
