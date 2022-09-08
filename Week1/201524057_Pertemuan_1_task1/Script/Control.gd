extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_btn_back_pressed():
	get_tree().change_scene("res://Scene/project.tscn")


func _on_btn_project2_pressed():
	get_tree().change_scene("res://Scene/project2.tscn")


func _on_btn_main_pressed():
	get_tree().change_scene("res://Scene/main.tscn")
