extends "res://Script/func_gen.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	var max_x = get_viewport().size.x
	var max_y = get_viewport().size.y
	var mid_x = max_x/2
	var mid_y = max_y/2

	#membuat polynom
	draw_polynomial_func(0.05, 0, 0, 1, mid_x, mid_y, 15, listWarna[2])

func _on_Button_pressed():
	get_tree().change_scene("res://Scene/main.tscn")


func _on_Button3_pressed():
	get_tree().change_scene("res://Scene/scene1.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Scene/scene1-3.tscn")
