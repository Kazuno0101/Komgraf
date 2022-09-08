extends "res://Script/line.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100
	var h = -120
	for i in 8:
		if i == 0:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.hotpink, 3)
		if i == 1:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.red, 3)
		if i == 2:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.cornflower, 3, true)
		if i == 3:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.webgray, 5)
		if i == 4:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.darkblue, 3, true)
		if i == 5:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.darksalmon, 7)
		if i == 6:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.blueviolet, 3)
		if i == 7:
			line_bresenham_2(Vector2(margin, mid_y + h + 15), Vector2(size_x - margin, mid_y + h + 15), Color.darkred, 3,true)
		h += 30
