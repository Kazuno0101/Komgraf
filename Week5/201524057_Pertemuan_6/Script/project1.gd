extends "res://Script/pola.gd"

var rotasi = 0
var skala = 1
var translate = 0

func _ready():
	pass
	
func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100

	pola1_bulat(skala,rotasi,50,5,Vector2(mid_x-250,mid_y-150),Color('#062C30'))
	pola1_garis(skala,rotasi,50,Vector2(mid_x-250,mid_y+50),Color('#E2D784'),15)
	
	pola2_kotak(skala,rotasi,translate,5,50,Vector2(mid_x,mid_y-150),Color('#46244C'),5)
	pola2_bulat(skala,rotasi,translate,5,50,Vector2(mid_x,mid_y+50),Color('#D49B54'),5)
	
	pola1_bulat(skala,rotasi,50,1,Vector2(mid_x+250,mid_y-150),Color('#630606'))
	pola3_segienam(skala,rotasi,20,80,Vector2(mid_x+250,mid_y+50),Color('#E83A14'))
