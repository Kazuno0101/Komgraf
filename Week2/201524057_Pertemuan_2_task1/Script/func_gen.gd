extends "res://Script/line.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func draw_linear_func(mid_x,mid_y,color):
	#fungsi y = x
	line_bresenham(mid_x, mid_y, mid_x-mid_y, 50, color)

#func draw_trigonometry_func():
func draw_polynomial_func(a, b, c, d, xo, yo,heigt, color):
	var x; var xa; var xb
	var y; var ya; var yb
	
	x = -heigt
	y = (a * x * x * x) + (b * x * x) + (c * x) + d
	xa = xo + x
	ya = yo - y
	while(x < heigt):
		x = x + 0.1
		y = (a * x * x * x) + (b * x * x) + (c * x) + d
		xb = xo + x
		yb = yo - y
		line_bresenham(xa, ya, xb, yb, color)
		xa = xb
		ya = yb

func draw_trigonometry_func(a, xo, yo, color):
	var max_x = get_viewport().size.x
	var max_y = get_viewport().size.y
	var x; var xa; var xb
	var y; var ya; var yb
	
	x = deg2rad(a)
	y = sin(x) * 50
	xa = xo + (x * 50)
	ya = yo - y
	while(a < 500):
		a = a + 1
		x = deg2rad(a)
		y = sin(x) * 50
		xb = xo + (x * 50)
		yb = yo - y
		line_bresenham(xa, ya, xb, yb, color)
		xa = xb
		ya = yb
