extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = false

func _on_btn_back_pressed():
	$ColorRect.visible = true
	$ColorRect.transition_to("res://Scene/main.tscn")

func _on_btn_mangaka_pressed():
	$ColorRect.visible = true
	$ColorRect.transition_to("res://Scene/project-1.tscn")
