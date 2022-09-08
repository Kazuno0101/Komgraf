extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#var listWarna : PoolColorArray
var listWarna = [Color(1, 0.71, 0.76, 1),Color( 0.94, 0.97, 1, 1 ),Color( 1, 0.98, 0.8, 1 )]

func put_pixel(x,y,color):
	
	draw_primitive(
		PoolVector2Array([Vector2(x,y)]),
		PoolColorArray([color]),
		PoolVector2Array()
	)

func line_dda(xa: float, ya: float, xb: float, yb: float, color):
	var x = xa
	var y = ya
	var dx = xb-xa
	var dy = yb-ya
	var steps
	var xIncrement
	var yIncrement
	
	if(abs(dx) > abs(dy)):
		steps = abs(dx)
	else:
		steps = abs(dy)
	
	xIncrement = dx/steps
	yIncrement = dy/steps
	
	put_pixel(round(x), round(y), color)
	
	for k in range(steps):
		x += xIncrement
		y += yIncrement
		put_pixel(x, y, color)

func line_bresenham(xa: float, ya: float, xb: float, yb: float, color):
	var dx: int = abs(xa - xb)
	var dy: int = abs(ya - yb)
	
	var p;
	var duady;
	var duadydx;
	
	p = 2 * dy - dx;
	duady = 2 * dy;
	duadydx =  2 * (dy - dx);
	
	var x: int
	var y: int
	var xEnd: int
	
	if xa > xb:
		x = xb
		y = yb
		xEnd = xa
	else:
		x = xa
		y = ya
		xEnd = xb
	put_pixel(x, y, color)
	
	while x < xEnd:
		x += 1
		
		if p < 0:
			p += duady
		else:
			y += 1
			p += duadydx
		
		put_pixel(x, y, color)
