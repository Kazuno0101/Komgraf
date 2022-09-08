extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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


func line_bresenham(ta:Vector2, tb:Vector2, color, dash:bool=false):
	var dx = abs(ta.x - tb.x)
	var dy = abs(ta.y - tb.y)
	var p = 2 * dy - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var t:Vector2
	var yinc = 1
	var xinc = 1
	var a = 2
	var k = 0

	if ta.x > tb.x :
		t = ta
		ta = tb
		tb = t
	put_pixel(ta.x, ta.y, color)	
	
	if dx == 0: 
		if ta.y > tb.y:
			t = ta
			ta = tb
			tb = t
			
		while ta.y < tb.y :
			a=1
			if(k%10==0 && dash):
				a=5

			ta.y += yinc * a
			put_pixel(ta.x, ta.y, color)
			k += 1
	else:
		while ta.x < tb.x :
			if ta.y > tb.y:
				yinc = -1
			a=1
			if(k%10==0 && dash):
				a=5

			ta.x += xinc  * a
			if p < 0 :
				p += twoDy
			else:
				ta.y += yinc  * a
				p += twoDyDx
			put_pixel(round(ta.x), round(ta.y), color)
			k+=1

func line_bresenham_2(ta:Vector2, tb:Vector2, color:Color, thick:int=1, dash:bool=false):	   
	var wx:float
	var wy:float	
	var skip:bool = false
	var m = 1
	
	if (tb.x-ta.x) == 0:
		skip = true
	else:
		m = (tb.y-ta.y)/(tb.x-ta.x)
	
	line_bresenham(ta, tb, color, dash)
	
	if(m<1) or not skip:
		wy=(thick-1)*sqrt(pow((tb.x-ta.x),2)+pow((tb.y-ta.y),2))/(2*abs(tb.x-ta.x))		
		for i in range(wy):
			line_bresenham(ta+Vector2(0, -i), tb+Vector2(0, -i), color, dash)
			line_bresenham(ta+Vector2(0, i), tb+Vector2(0, i), color, dash)
	else:
		wx=(thick-1)*sqrt(pow((tb.x-ta.x),2)+pow((tb.y-ta.y),2))/(2*abs(tb.y-ta.y))		
		for i in range(wx):
			line_bresenham(ta+Vector2(-i, 0), tb+Vector2(-i, 0), color, dash)
			line_bresenham(ta+Vector2(i, 0), tb+Vector2(i, 0), color, dash)
