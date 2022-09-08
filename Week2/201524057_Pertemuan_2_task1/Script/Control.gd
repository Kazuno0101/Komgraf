extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/main.tscn")


func _on_btn_ilus_pressed():
	get_tree().change_scene("res://Scene/scene1.tscn")


func _on_btn_linear_pressed():
	get_tree().change_scene("res://Scene/scene2.tscn")


func _on_btn_polynomial_pressed():
	get_tree().change_scene("res://Scene/scene3.tscn")

func _on_btn_trigonometri_pressed():
	get_tree().change_scene("res://Scene/scene4.tscn")
