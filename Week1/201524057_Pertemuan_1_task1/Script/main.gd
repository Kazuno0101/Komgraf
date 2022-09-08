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


func _on_Project_pressed():
	get_tree().change_scene("res://Scene/project.tscn")


func _on_Profile_pressed():
	get_tree().change_scene("res://Scene/profile.tscn")


func _on_Cara_pressed():
	get_tree().change_scene("res://Scene/cara.tscn")
