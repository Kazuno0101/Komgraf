extends "res://Script/shape.gd"


func _ready():
	pass # Replace with function body.

func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100

	draw_lingkaran(mid_x+margin, mid_y, 100, Color.yellowgreen)
	draw_lingkaran(mid_x, mid_y+margin, 100, Color.yellowgreen)
	draw_lingkaran(mid_x-margin, mid_y, 100, Color.yellowgreen)
	draw_lingkaran(mid_x, mid_y-margin, 100, Color.yellowgreen)
	draw_lingkaran(mid_x+margin*.75, mid_y+margin*.75, 100, Color.crimson)
	draw_lingkaran(mid_x-margin*.75, mid_y-margin*.75, 100, Color.crimson)
	draw_lingkaran(mid_x+margin*.75, mid_y-margin*.75, 100, Color.crimson)
	draw_lingkaran(mid_x-margin*.75, mid_y+margin*.75, 100, Color.crimson)
