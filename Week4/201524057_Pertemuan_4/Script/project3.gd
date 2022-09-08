extends "res://Script/kelopak.gd"


func _ready():
	pass # Replace with function body.

func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100

	bunga_kelopak(8, Vector2(mid_x,mid_y)-Vector2(200, 0), Color.royalblue, Color.black)
	bunga_8_kelopak(Vector2(mid_x,mid_y)+Vector2(200, 0), Color.green, Color.webmaroon)
