extends "res://Script/shape.gd"


func _ready():
	pass # Replace with function body.

func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100
	var persegi = 10
	var ketupat = 20
	
	for i in 5:
		draw_persegi(Vector2(mid_x-persegi/2, mid_y-persegi/2), persegi, Color.crimson, 5)
		persegi += 10
	
	for i in 5:
		draw_ketupat(Vector2(mid_x-ketupat/2, mid_y-ketupat/2), ketupat, ketupat, Color.peru, 5)
		ketupat += 20
	
	draw_ellipse(mid_x-50, mid_y, 100, 50, Color.rebeccapurple)
	draw_ellipse(mid_x+50, mid_y, 100, 50, Color.rebeccapurple)
	draw_ellipse(mid_x, mid_y+50, 50, 100, Color.rebeccapurple)
	draw_ellipse(mid_x, mid_y-50, 50, 100, Color.rebeccapurple)

