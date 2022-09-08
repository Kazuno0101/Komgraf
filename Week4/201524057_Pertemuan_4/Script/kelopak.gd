extends "res://Script/shape.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func bunga_kelopak(n:int ,pos:Vector2, color:Color, color2:Color):	
	var point = Vector2(50, 50)
	draw_lingkaran(pos, 50, color2)
	for i in range(n):
		point = rotasiVector2(point, 360/n)
		if (i+1)%2 == 0:
			draw_lingkaran(translasiVector2(point, pos.x, pos.y), 100, color)
		else:
			draw_lingkaran(translasiVector2(point, pos.x, pos.y), 100, color2)
			
func bunga_4_kelopak(tipus:Vector2, color:Color, color2:Color):
	var n = 4
	var point = Vector2(0, 50)
	draw_lingkaran(tipus, 50, color2)
	for i in range(n):
		point = rotasiVector2(point, 360/n)
		if (i+1)%2 == 0:
			draw_ellipse(translasiVector2(point, tipus.x, tipus.y), 50, 100, color)
		else:
			draw_ellipse(translasiVector2(point, tipus.x, tipus.y), 100, 50, color)

func bunga_8_kelopak(tipus:Vector2, color:Color, color2:Color):
	var n = 8
	var point = Vector2(0, 50)
	draw_lingkaran(tipus, 50, color2)
	for i in range(n):
		point = rotasiVector2(point, 360/n)
		if(i+1)%4 == 0:
			draw_ellipse(translasiVector2(point, tipus.x, tipus.y), 50, 100, color2)
		elif (i+1)%2 == 0:
			draw_ellipse(translasiVector2(point, tipus.x, tipus.y), 50, 100, color)
		else:
			draw_ellipse(translasiVector2(point, tipus.x, tipus.y), 100, 50, color)
