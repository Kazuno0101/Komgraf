extends "res://script/draw.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	var color = Color(5.0, 1.0, 2.0)
	var color2 = Color( 1, 1, 0, 1)	
	var color3 = Color( 0, 0, 0, 1)
	var color4 = Color( 1, 0, 0, 1 )
	draw_kartesian(color)
	draw_smile(150,color2,color,color3,color4)
