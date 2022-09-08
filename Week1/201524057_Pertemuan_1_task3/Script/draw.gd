extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_btn_back_pressed():
	get_tree().change_scene("res://Scene/project.tscn")

var windowSize = Vector2(get_rect().size.x, get_rect().size.y)

func draw_circle_in_middle(radius, color):
	var center = Vector2(windowSize.x / 2, windowSize.y / 2)
	draw_circle(center, radius, color)

func draw_horizontal_line(color):
	draw_line(Vector2(0,windowSize.y / 2), Vector2(windowSize.x, windowSize.y / 2), color)

func draw_vertikal_line(color):
	draw_line(Vector2(windowSize.x / 2, 0), Vector2(windowSize.x / 2, windowSize.y), color)

func draw_kartesian(color):
	draw_horizontal_line(color)
	draw_vertikal_line(color)

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

func draw_smile(radius, color, color2, color3, color4):
	var center = Vector2(windowSize.x / 2, windowSize.y / 2)
	var left_eye = Vector2((center.x) - (radius * .4), (center.y) - (radius / 2.5))
	var right_eye = Vector2((center.x) + (radius * .4), (center.y) - (radius / 2.5))
	draw_circle(center, radius, color)
	draw_circle(left_eye, (radius / 3), color2)
	draw_circle(right_eye, (radius / 3), color2)
	draw_circle(left_eye, (radius / 5), color3)
	draw_circle(right_eye, (radius / 5), color3)
	
	var angle_from = 90
	var angle_to = 270
	var mouth = Vector2(center.x, (center.y) + (radius / 5))
	var teeth1 = Vector2(center.x + (radius / 3), (center.y) + (radius / 5))
	var teeth2 = Vector2(center.x - (radius / 3), (center.y) + (radius / 5))
	draw_circle_arc_poly(mouth, (radius / 1.5), angle_from, angle_to, color3)
	draw_circle_arc_poly(mouth, (radius / 3), angle_from, angle_to, color4)
	draw_circle_arc_poly(teeth1, (radius / 5), angle_from, angle_to, color2)
	draw_circle_arc_poly(teeth2, (radius / 5), angle_from, angle_to, color2)
