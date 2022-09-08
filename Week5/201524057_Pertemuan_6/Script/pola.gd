extends "res://Script/shape.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pola1_bulat(skala:float,rotasi:int, r: int, thick: int, pos:Vector2, color:Color):	
	var i = 0
	while i < thick:
		draw_lingkaran(skala,pos,r+i,color)
		i += 1

func pola1_garis(skala:float, rotasi:int, length:int, pos:Vector2, color:Color, thick:int=1, dash:bool=false):
	var point = Vector2(0,length)
	var garis
	var temp
	for i in range(4):
		point = rotasiVector2(point, 90)
		temp = rotasiVector2(point, rotasi)
		garis = translasiVector2(temp, pos.x, pos.y) 
		garis = scaleVector2(garis,skala,pos)
		#line_dda_2(pos, garis, color, thick, dash)
		draw_line(pos, garis, color, thick, dash)
	
func pola1_semua(skala:float, rotasi:int, length:int, pos:Vector2, color1:Color,color2:Color, thick:int=1, thick2:int=1, dash:bool=false):
	pola1_bulat(skala,rotasi,length, length/10,pos,color1)
	pola1_garis(skala,rotasi,length,pos,color2,thick2)

func pola2_bulat(skala:float, rotasi:int, translate:int, r:int, length:int, pos:Vector2, color:Color, thick:int=1, dash:bool=false):
	var pos2 = Vector2(pos)
	var temp
	var length2 = length*.60
	var length_temp = length

	for i in range(4):
		if i==0:
			pos2 = translasiVector2(pos, -length2, -length2)
			if length < translate:
				temp = translasiVector2(pos2, translate, translate)
			else:
				temp = translasiVector2(pos2, -translate, -translate)
		if i==1:
			pos2 = translasiVector2(pos, length2, -length2)
			if length < translate:
				temp = translasiVector2(pos2, -translate, translate)
			else:
				temp = translasiVector2(pos2, translate, -translate)
		if i==2:
			pos2 = translasiVector2(pos, length2, length2)
			if length < translate:
				temp = translasiVector2(pos2, -translate, -translate)
			else:
				temp = translasiVector2(pos2, translate, translate)
		if i==3:
			pos2 = translasiVector2(pos, -length2, length2)
			if length < translate:
				temp = translasiVector2(pos2, translate, -translate)
			else:
				temp = translasiVector2(pos2, -translate, translate)
		
		length_temp = length_temp + rotasi
		draw_lingkaran(skala,temp,r,color)
		
func pola2_kotak(skala:float, rotasi:int, translate:int, r:int, length:int, pos:Vector2, color:Color, thick:int=1, dash:bool=false):
	var pos2 = Vector2(pos)
	var temp
	var length2 = length*.60
	var length_temp = length
	for i in range(4):
		if i==0:
			pos2 = translasiVector2(pos, -length2, -length2)
			if length < translate:
				temp = translasiVector2(pos2, translate, translate)
			else:
				temp = translasiVector2(pos2, -translate, -translate)
		if i==1:
			pos2 = translasiVector2(pos, length2, -length2)
			if length < translate:
				temp = translasiVector2(pos2, -translate, translate)
			else:
				temp = translasiVector2(pos2, translate, -translate)
		if i==2:
			pos2 = translasiVector2(pos, length2, length2)
			if length < translate:
				temp = translasiVector2(pos2, -translate, -translate)
			else:
				temp = translasiVector2(pos2, translate, translate)
		if i==3:
			pos2 = translasiVector2(pos, -length2, length2)
			if length < translate:
				temp = translasiVector2(pos2, translate, -translate)
			else:
				temp = translasiVector2(pos2, -translate, translate)
		
		length_temp = length_temp + rotasi
		draw_persegi(Vector2(temp.x-(length/2), temp.y-(length/2)),length, color,thick, dash)

func pola2_semua(skala:float, rotasi:int, translate:int,  r:int, length:int, pos:Vector2, color1:Color,color2:Color, thick:int=1, dash:bool=false):
	pola2_bulat(skala,rotasi,translate,r,length,pos,color1)
	pola2_kotak(skala,rotasi,translate,r,length,pos,color2)


func pola3_bulat(skala:float, r:int,length:int, pos:Vector2, color:Color):
	var pos2 = Vector2(length,0)
	
	draw_lingkaran(skala,pos,r,color)

func pola3_segienam(skala:float,rotasi:int, r:int,length:int, pos:Vector2, color:Color):
	var pos2 = Vector2(length,0)
	var garis
	var temp

	for i in range(6):
		pos2 = rotasiVector2(pos2, 360/6)
		temp = rotasiVector2(pos2, rotasi)
		garis = translasiVector2(temp, pos.x, pos.y) 
		draw_segienam(skala,rotasi,r,garis,color)

func pola3_semua(skala:float,rotasi:int, r:int,length:int, pos:Vector2, color1:Color,color2:Color):
	pola3_bulat(skala, r,length, pos, color1)
	pola3_segienam(skala, rotasi, r, length, pos, color2)


func pola_tantangan(count:int, skala:float, rotasi:int,translate:int, r:int,length:int, pos:Vector2, color1:Color,color2:Color,thick:int=1,thick2:int=1):
	var point = Vector2(length, length)
	var a
	var b
	var temp
		
	draw_segilima(length,pos,color1,5,1)
	for i in range(5):
			temp = rotasiVector2(point, rotasi)
			a = translasiVector2(temp, pos.x, pos.y)
			point = rotasiVector2(point, 360/5)
			temp = rotasiVector2(point, rotasi)
			b = translasiVector2(temp, pos.x, pos.y)
			a = scaleVector2(a,2,pos)
			b = scaleVector2(b,2,pos)
			line_dda_2(a, b, Color.gray,1,1,true)
			if(i == 3 && count > 0 && count % 2 == 0):
				pola1_semua(skala,rotasi,r,a,color1,color2,thick,thick2)
			elif(i == 3 && count > 0 && count % 2 == 1):
				pola1_semua(skala,rotasi,r,a,color2,color1,thick,thick2)
			if(i == 2 && count > 35 && count % 2 == 0):
				pola2_semua(skala,rotasi,translate,r/5,length,a,color1,color2)
			elif(i == 2 && count > 35 && count % 2 == 1):
				pola2_semua(skala,rotasi,translate,r/5,length,a,color2,color1)
			if(i == 1 && count > 70 && count % 2 == 0):
				pola3_semua(skala,rotasi,r/2,length,a,color1,color2)
			elif(i == 1 && count > 70 && count % 2 == 1):
				pola3_semua(skala,rotasi,r/2,length,a,color2,color1)
