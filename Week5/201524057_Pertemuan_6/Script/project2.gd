extends "res://Script/pola.gd"

var rotasi = 0
var skala = 1
var translate = 1
var trans = true

func _ready():
	pass
	
func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100
	
	pola1_semua(skala,rotasi,50,Vector2(mid_x-250,mid_y),Color('#062C30'),Color('#E2D784'),1,15)
	
	pola2_semua(skala,rotasi,translate,5,50,Vector2(mid_x,mid_y),Color('#46244C'),Color('#D49B54'),5)
	
	pola3_semua(skala,rotasi,20,80,Vector2(mid_x+250,mid_y),Color('#630606'),Color('#E83A14'))

func _process(delta):
	rotasi += 2
	
	if(trans == true):
		if(translate==0):
			trans = false
			print("jalan")
		else:
			translate -= 1
			skala -= 0.01
			print(translate)
	else:
		if(translate == 50):
			trans = true
		else:
			translate += 1
			skala += 0.01
			print(translate)

	update()
