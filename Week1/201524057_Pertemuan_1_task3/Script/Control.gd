extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_btn_back_pressed():
	get_tree().change_scene("res://Scene/main.tscn")


func _on_btn_titik_pressed():
	get_tree().change_scene("res://Scene/Titik.tscn")


func _on_btn_vertikal_pressed():
	get_tree().change_scene("res://Scene/vertikal.tscn")


func _on_btn_horizontal_pressed():
	get_tree().change_scene("res://Scene/horizontal.tscn")


func _on_btn_kartesian_pressed():
	get_tree().change_scene("res://Scene/kartesian.tscn")


func _on_btn_smile_pressed():
	get_tree().change_scene("res://Scene/smile.tscn")
