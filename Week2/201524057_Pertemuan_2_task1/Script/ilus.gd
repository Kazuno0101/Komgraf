extends "res://Script/func_gen.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_steps: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	update()

func _draw():
	var max_x = get_viewport().size.x
	var max_y = get_viewport().size.y
	var mid_x = max_x/2
	var mid_y = max_y/2

	# Membuat linear	
	draw_linear_func(mid_x,mid_y,listWarna[2])

func _on_Button_pressed():
	get_tree().change_scene("res://Scene/main.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Scene/scene1-2.tscn")
