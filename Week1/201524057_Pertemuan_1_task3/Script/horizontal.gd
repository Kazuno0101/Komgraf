extends "res://script/draw.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	var color = Color(10.0, 5.0, 7.0)
	draw_horizontal_line(color)
