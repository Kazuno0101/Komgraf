extends "res://Script/primitif.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func frame(margin):
	var size_x = get_viewport().size.x
	var size_y= get_viewport().size.y
	
	line_bresenham(margin, margin, size_x - margin, margin, listWarna[0])
	line_dda(size_x - margin, margin, size_x - margin, size_y - margin, listWarna[0])
	line_bresenham(size_x - margin, size_y - margin, margin, size_y - margin, listWarna[0])
	line_dda(margin, size_y - margin, margin, margin, listWarna[0])
	
func kartesian(margin):
	var max_x = get_viewport().size.x
	var max_y= get_viewport().size.y
	var mid_x = max_x/2
	var mid_y = max_y/2
	
	line_dda(mid_x, margin, mid_x, max_y - margin, listWarna[1])
	line_bresenham(margin, mid_y, max_x - margin, mid_y, listWarna[1])

func _draw():
	frame(50)
	kartesian(50)
