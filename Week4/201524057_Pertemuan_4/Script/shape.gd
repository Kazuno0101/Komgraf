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

func draw_ketupat(length:int, pos:Vector2, color:Color=Color.red, thick:int=1, dot:int=1, dash:bool=false):
	var point = Vector2(length, 0)
	var a
	var b
	for i in range(4):
		a = translasiVector2(point, pos.x, pos.y)
		point = rotasiVector2(point, 90)
		b = translasiVector2(point, pos.x, pos.y) 		
		line_bresenham_2(a, b,  color, thick, dash)		
		
func draw_jajargenjang(length:int, pos:Vector2, color:Color=Color.red, thick:int=1, dot:int=1, dash:bool=false):
	var point = Vector2(length, length)
	var a
	var b
	var pindah = 0
	for i in range(4):		
		a = translasiVector2(point, pos.x + pindah, pos.y)				
		if (i + 1) % 2 != 0:			
			point = rotasiVector2(point, 90)
			b = translasiVector2(point, pos.x + pindah, pos.y) 		
		else:
			point = rotasiVector2(point, 180)		
			b = translasiVector2(point, pos.x + pindah, pos.y) 		
			point = Vector2(-length, -length)		
			pindah = 2 * length
		line_bresenham_2(a, b,  color, thick, dash)		

func draw_layang2(length:int, pos:Vector2, color:Color=Color.red, thick:int=1, dot:int=0, dash:bool=false):
	var point = Vector2(0, -length)
	var a
	var b
	var temp = point
	for i in range(4):
		a = translasiVector2(point, pos.x, pos.y)
		point = rotasiVector2(temp, 90)
		temp = point
		b = translasiVector2(point, pos.x, pos.y)
		if i==1:
			b = translasiVector2(b, 0, length)
			point = translasiVector2(point, 0, length)
		
		line_dda_2(a, b, color, thick, dot, dash)

func draw_trapesium(length:int, pos:Vector2, color:Color=Color.red, thick:int=1, dot:int=0, dash:bool=false):
	var point = Vector2(0, -length)
	var a
	var b	
	for i in range(4):
		a = translasiVector2(point, pos.x, pos.y)
		point = rotasiVector2(point, -90)
		b = translasiVector2(point, pos.x, pos.y)
		
		if (i+1)%2 == 0:
			b = translasiVector2(b, 0, length)
			point = translasiVector2(point, 0, length)
		
		line_dda_2(a, b, color, thick, dot, dash)

func draw_segilima(length:int, pos:Vector2, color:Color=Color.red, thick:int=1, dot:int=0, dash:bool=false):
	var point = Vector2(length, length)
	var a
	var b
	for i in range(360/5):
		a = translasiVector2(point, pos.x, pos.y)
		point = rotasiVector2(point, 360/5)
		b = translasiVector2(point, pos.x, pos.y) 		
		line_dda_2(a, b, color, thick, dot, dash)

func draw_segienam(length:int, pos:Vector2, color:Color=Color.red, thick:int=1, dot:int=0, dash:bool=false):
	var point = Vector2(length, length)
	var a
	var b
	for i in range(360/6):
		a = translasiVector2(point, pos.x, pos.y)
		point = rotasiVector2(point, 360/6)
		b = translasiVector2(point, pos.x, pos.y) 		
		line_dda_2(a, b, color, thick, dot, dash)

func draw_lingkaran(pos:Vector2, r:int, color:Color):
	var xCenter:int = pos.x
	var yCenter:int = pos.y
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

func draw_ellipse(pos:Vector2, Rx:int, Ry:int, color:Color, tipe:String="thick"):
	var xCenter:int = pos.x
	var yCenter:int = pos.y
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
