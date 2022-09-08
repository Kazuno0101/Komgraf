extends Control


func _ready():
	$ColorRect.visible = false

func _on_btn_back_pressed():
	$ColorRect.visible = true
	$ColorRect.transition_to("res://Scene/project.tscn")


func _on_btn_back4_pressed():
	$ColorRect.visible = true
	$ColorRect.transition_to("res://Scene/project-1.tscn")


func _on_btn_back2_pressed():
	$ColorRect.visible = true
	$ColorRect.transition_to("res://Scene/project-4.tscn")
