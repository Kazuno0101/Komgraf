extends "res://Script/primitif.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func frame(margin):
	var size_x = get_viewport().size.x
	var size_y= get_viewport().size.y
	var frame = {
		"atas_kiri" : Vector2(margin, margin),
		"atas_kanan" : Vector2(size_x-margin, margin),
		"bawah_kiri": Vector2(margin, size_y-margin),
		"bawah_kanan" : Vector2(size_x-margin, size_y-margin)
	}
	
	line_bresenham(frame['atas_kiri'],frame['atas_kanan'], Color.indigo)
	line_dda(size_x - margin, margin, size_x - margin, size_y - margin, Color.indigo)
	line_bresenham(frame['bawah_kiri'],frame['bawah_kanan'], Color.indigo)
	line_dda(margin, size_y - margin, margin, margin, Color.indigo)
	
func kartesian(margin):
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var kartesian = {
		"kiri" : Vector2(margin, mid_y),
		"kanan": Vector2(size_x - margin, mid_y),
	}
	line_dda(mid_x, margin, mid_x, size_y - margin, Color.midnightblue )
	line_bresenham(kartesian['kiri'], kartesian['kanan'], Color.midnightblue)

#func _draw():
#	frame(50)
#	kartesian(50)
