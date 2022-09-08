extends "res://Script/shape.gd"


func _ready():
	pass # Replace with function body.

func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100
	
	draw_persegi(Vector2(margin , margin), 50, Color.chartreuse, 1, true)
	draw_persegi(Vector2(margin*2, margin), 50, Color.crimson, 5)
	
	draw_persegi_panjang(Vector2(mid_x - margin*1.5, margin), 100, 50, Color.darkslategray, 1, true)
	draw_persegi_panjang(Vector2(mid_x + margin/2, margin), 100, 50, Color.black, 5)
	
	draw_segitiga_siku(Vector2(size_x-margin*2, margin),80, 100, Color.lightgreen, 1, true)
	draw_segitiga_siku(Vector2(size_x-margin*3, margin),80, 100, Color.darkorchid, 5)
	
	draw_trapesium_siku(Vector2(margin, mid_y-margin), 80, 130, 80, Color.lightseagreen,1, true)
	draw_trapesium_siku(Vector2(margin*3, mid_y-margin), 80, 130, 80, Color.navyblue, 5)

	draw_ketupat(Vector2(mid_x+margin*.5, mid_y-margin), 80, 80, Color.olive, 1, true)
	draw_ketupat(Vector2(mid_x+margin*2, mid_y-margin), 80, 80, Color.peru, 5)

	draw_jajar_genjang(Vector2(margin, mid_y+10), 80, 50, 40, Color.mediumseagreen, 1,true)
	draw_jajar_genjang(Vector2(margin*3, mid_y+10), 80, 50, 40, Color.aquamarine, 5)

	draw_layang_layang(Vector2(margin,mid_y+110), 200, 100, Color.darkorange, 1, true)
	draw_layang_layang(Vector2(margin*3,mid_y+110), 200, 100, Color.antiquewhite, 5)

	draw_lingkaran(mid_x+margin, mid_y+margin, 50, Color.yellowgreen)
	draw_ellipse(mid_x+margin*3, mid_y+margin, 100, 50, Color.rebeccapurple)
