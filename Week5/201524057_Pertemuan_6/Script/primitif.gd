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
	var t:Vector2		
	
	
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
			k+=12

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

func line_dda_2(ta:Vector2, tb:Vector2, color:Color, thick:int= 1, space:int= 0, dot:bool= false):
	var dx = tb.x - ta.x
	var dy = tb.y - ta.y
	
	var step = abs(dx) if (abs(dx) > abs(dy)) else abs(dy)
	
	var x_inc = dx / step
	var y_inc = dy / step
	var x = ta.x
	var y = ta.y 
	
	put_pixel(x, y, color)
	
	if (space != 0):
		for k in step :
			x += x_inc
			y += y_inc
			
			if ((k / space) % 2):
				if (dot && (k%space == 1)):
					put_pixel(x, y, color)
			else:
				put_pixel(x, y, color)
	else:
		for k in step :
			x += x_inc
			y += y_inc
			put_pixel(x, y, color)
	if (thick != 1):
		ta.y += 1
		tb.y += 1
		thick -= 1
		line_dda_2(ta,tb,color,thick,space)

func tambahMatrix(first:Array, second:Array):
	var r1 = first.size()
	var c1 = first[0].size()
	var r2 = second.size()
	var c2 = second[0].size()
	var result = []
	
	if r1 == r2 and c1 == c2:
		for i in range(r1):
			result.append([])
			for j in range(c2):
				result[i].append(0)

		for i in range(r1):
			for j in range(c1):
				result[i][j] = first[i][j] + second[i][j]
		
	return result
	
func kurangMatrix(first:Array, second:Array):
	var r1 = first.size()
	var c1 = first[0].size()
	var r2 = second.size()
	var c2 = second[0].size()
	var result = []
	
	if r1 == r2 and c1 == c2:
		for i in range(r1):
			result.append([])
			for j in range(c2):
				result[i].append(0)

		for i in range(r1):
			for j in range(c1):
				result[i][j] = first[i][j] - second[i][j]
		
	return result
func kaliMatrix(first:Array, second:Array):
	var r1 = first.size()
	var c1 = first[0].size()
	var r2 = second.size()
	var c2 = second[0].size()
	var result = []
	
	if c1 == r2:
		for i in range(r1):
			result.append([])
			for j in range(c2):
				result[i].append(0)

		for i in range(r1):
			for j in range(c2):
				for k in range(c1):
					result[i][j] += first[i][k] * second[k][j];
	return result

func scaleVector2(point:Vector2, scaleFactor:float, tikpus:Vector2=Vector2(0, 0)):
	var matrikRumus = [[scaleFactor,0], [0, scaleFactor]]
	var matrikPoint = [[point.x - tikpus.x], [point.y - tikpus.y]]
	var matrikTikpus = [[tikpus.x], [tikpus.y]]
	var res = tambahMatrix(kaliMatrix(matrikRumus, matrikPoint), matrikTikpus)
	
	point.x = res[0][0]
	point.y = res[1][0]
	
	return point

func rotasiVector2(point:Vector2, derajat:float, tikpus:Vector2=Vector2(0, 0)):
	derajat = deg2rad(derajat)
	
	var matrikRumus = [[cos(derajat), -sin(derajat)], [sin(derajat), cos(derajat)]]
	var matrikPoint = [[point.x - tikpus.x], [point.y - tikpus.y]]
	var matrikTikpus = [[tikpus.x], [tikpus.y]]
	var res = tambahMatrix(kaliMatrix(matrikRumus, matrikPoint), matrikTikpus)
	
	point.x = res[0][0]
	point.y = res[1][0]
	
	return point


func translasiVector2(point:Vector2, a:int, b:int):
	point.x += a
	point.y += b
	return point

	
func matrix3x3SetIdentity(matrix):		
	for x in range(3):
		matrix.append([])
		matrix[x]=[]
		for y in range(3):
			matrix[x].append([])
			matrix[x][y] = 1 if x == y else 0

func matrix3x3PreMultiply(matrix_a, matrix_b):
	var temp = []
	for r in range(3):
		temp.append([])
		temp[r] = []
		for c in range(3):
			temp[r].append([])
			temp[r][c] = matrix_a[r][0]*matrix_b[0][c] + matrix_a[r][1]*matrix_b[1][c] + matrix_a[r][2]*matrix_b[2][c] 
	
	for r in range(3):
		for c in range(3):
			matrix_b[r][c] = temp[r][c]	
	
func scale2(sx:float, sy:float, refPt:Vector2):
	var theMatrix = []
	var m = []
	matrix3x3SetIdentity(m)
	m[0][0] = sx
	m[0][2] = (1 - sx) * refPt.x
	m[1][1] = sy
	m[1][2] = (1 - sy) * refPt.y
	matrix3x3PreMultiply(m, theMatrix)

func rotate2(a:float, refPt:Vector2):
	var theMatrix = []
	var m = []
	matrix3x3SetIdentity(m)
	a = deg2rad(a)
	m[0][0] = cos(a)
	m[0][1] = -sin(a)
	m[0][2] = refPt.x * (1-cos(a)) + refPt.y * sin(a)
	m[1][0] = sin(a)
	m[1][1] = cos(a)
	m[1][2] = refPt.y * (1 - cos(a)) - refPt.x * sin(a)
	matrix3x3PreMultiply(m, theMatrix)
	
func transformPoints2(npts:int, pts:PoolVector2Array):
	var theMatrix = []
	var temp:float
	for k in range(npts):
		temp = theMatrix[0][0] * pts[k].x + theMatrix[0][1] * pts[k].y + theMatrix[0][2]
		pts[k].y = theMatrix[1][0] * pts[k].x + theMatrix[1][1] * pts[k].y + theMatrix[2][2]
		pts[k].x = temp
