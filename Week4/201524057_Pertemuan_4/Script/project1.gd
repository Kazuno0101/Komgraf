extends "res://Script/shape.gd"


func _ready():
	pass # Replace with function body.
	
func _draw():
	var size_x = get_viewport().size.x
	var size_y = get_viewport().size.y
	var mid_x = size_x/2
	var mid_y = size_y/2
	var margin = 100

	draw_ketupat(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(-500, -300), Color.black, 5)
	draw_ketupat(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(-350, -300), Color.black, 3, 10)
	draw_layang2(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(-200, -300), Color.chartreuse, 5) 
	draw_layang2(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(-50, -300), Color.chartreuse, 3, 2)
	draw_jajargenjang(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(50, -300), Color.black, 5)
	draw_jajargenjang(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(200, -300), Color.black, 3, 2)
	draw_trapesium(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(-500, -100), Color.yellow, 5)	
	draw_trapesium(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(-330, -100), Color.yellow, 3,2)	
	draw_segilima(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(-150, -100), Color.cyan, 5)	
	draw_segilima(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(0, -100), Color.cyan, 3,2)	
	draw_segienam(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(150, -100), Color.tomato, 5)	
	draw_segienam(50, Vector2(mid_x+margin,mid_y+margin)+Vector2(300, -100), Color.tomato, 3,2)	
