extends "res://Script/line.gd"

func draw_shape(points:PoolVector2Array, color:Color, thick:int=1, dash:bool=false):
	for i in points.size()-1:
		line_bresenham_2(points[i], points[i+1], color, thick, dash)
	
	line_bresenham_2(points[0], points[points.size()-1], color, thick, dash)

func draw_persegi(titikAwal:Vector2, panjang:int, color:Color, thick:int=1, dash:bool=false):
	#buat titik
	var points = PoolVector2Array(
		[titikAwal, titikAwal+Vector2(panjang, 0), 
		titikAwal+Vector2(panjang, panjang), titikAwal+Vector2(0, panjang)]
	)		
	draw_shape(points, color, thick, dash)
	
func draw_persegi_panjang(titikAwal:Vector2, panjang:int, lebar:int, color:Color, thick:int=1, dash:bool=false):
	#buat titik
	var points = PoolVector2Array(
		[titikAwal, titikAwal+Vector2(panjang, 0), 
		titikAwal+Vector2(panjang, lebar), titikAwal+Vector2(0, lebar)]
	)	
	draw_shape(points, color, thick,  dash)
	
func draw_segitiga_siku(titikAwal:Vector2, b:int, c:int, color:Color, thick:int=1, dash:bool=false):
	#buat titik	
	var a = pow(c, 2) - pow(b, 2)
	a = sqrt(a)
	var points = PoolVector2Array(
		[titikAwal, titikAwal+Vector2(0, a), titikAwal+Vector2(b, a)]
	)
	draw_shape(points, color, thick, dash)
	
func draw_trapesium_siku(titikAwal:Vector2, a:int, c:int, d:int, color:Color, thick:int=1, dash:bool=false):
	#buat titik	
	var temp
	if d > c:
		temp = d
		d = c
		c = temp
	var f = pow(c, 2) - pow(d, 2)	
	f = sqrt(f)
	var b = a + f
	
	var points = PoolVector2Array(
		[titikAwal, titikAwal+Vector2(0, d), titikAwal+Vector2(b, d), titikAwal+Vector2(a, 0)]
	)
	draw_shape(points, color, thick, dash)

func draw_ketupat(titikAwal:Vector2, d1:int, d2:int, color:Color, thick:int=1, dash:bool=false):
	d1 = d1/2
	d2 = d2/2
	#buat titik
	var points = PoolVector2Array([
		titikAwal+Vector2(d2,0), 
		titikAwal+Vector2(d2*2, d2), 
		titikAwal+Vector2(d1, d1*2), 
		titikAwal+Vector2(0,d1)
	])
	draw_shape(points, color, thick, dash)

func draw_jajar_genjang(titikAwal:Vector2, a:int, b:int, t:int, color:Color, thick:int=1, dash:bool=false):
	#buat titik
	var points = PoolVector2Array(
		[titikAwal, titikAwal+Vector2(a,0), 
		titikAwal+Vector2(a+b,t),titikAwal+Vector2(b,t)]
	)
	draw_shape(points, color, thick, dash)

func draw_layang_layang(titikAwal:Vector2, d1:int, d2:int, color:Color, thick:int=1, dash:bool=false):
	d1 = d1/2
	d2 = d2/2
	#buat titik
	var points = PoolVector2Array([
		titikAwal+Vector2(d2,0),
		titikAwal+Vector2(d1, d2), 
		titikAwal+Vector2(d2,d1), 
		titikAwal+Vector2(0,d2)
	])
	draw_shape(points, color, thick, dash)

func draw_lingkaran(xCenter:int, yCenter:int, r:int, color:Color):
	var x:int = 0
	var y = r
	var p = 1 - r
	
	circlePlotPoints(xCenter, yCenter, x, y, color)
	
	while x < y:
		x += 1
		if p < 0:
			p += 2 * x + 1
		else:
			y -= 1
			p += 2 * (x - y) + 1
		circlePlotPoints(xCenter, yCenter, x, y, color)
	
func circlePlotPoints(xCenter:int, yCenter:int, x:int, y:int, color:Color):	
	put_pixel(xCenter + x, yCenter + y, color)
	put_pixel(xCenter - x, yCenter + y, color)
	put_pixel(xCenter + x, yCenter - y, color)
	put_pixel(xCenter - x, yCenter - y, color)
	put_pixel(xCenter + y, yCenter + x, color)
	put_pixel(xCenter - y, yCenter + x, color)
	put_pixel(xCenter + y, yCenter - x, color)
	put_pixel(xCenter - y, yCenter - x, color)

func draw_ellipse(xCenter:int, yCenter:int, Rx:int, Ry:int, color:Color, tipe:String="thick"):
	var Rx2 = Rx*Rx
	var Ry2 = Ry*Ry
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2*y
	var i = x
	
	ellipsePlotPoints(xCenter,yCenter,x,y, color)
	#Region1
	p = round(Ry2 - (Rx2 * Ry) + (0.25 * Rx2))
	while (px < py):
		x = x + 1
		i = i + 1
		px += twoRy2
		if (p < 0):
			p += Ry2 + px
		else :
			y = y - 1
			py -= twoRx2
			p += Ry2 + px - py
		ellipsePlotPoints(xCenter,yCenter,x,y, color)	
	
	#Region2	
	p = round(Ry2 * (x+0.5) * (x + 0.5) + Rx2 * (y-1) * (y-1) - Rx2 * Ry2)
	while (y > 0):
		y = y - 1
		i = i + 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else :
			x = x + 1
			px += twoRy2
			p += Rx2 - py + px
		ellipsePlotPoints(xCenter,yCenter,x,y, color)

func ellipsePlotPoints(xCenter:int, yCenter:int, x:int, y:int, color:Color):
	put_pixel(xCenter + x, yCenter + y, color)
	put_pixel(xCenter - x, yCenter + y, color)
	put_pixel(xCenter + x, yCenter - y, color)
	put_pixel(xCenter - x, yCenter - y, color)
