extends ColorRect

export(String, FILE, "*.tscn") var next_scene_path

onready var _anim_player := $AnimationPlayer

func _ready()-> void:
	#Plays the animation backward to fade in
	_anim_player.play_backwards("transisi")

func transition_to(_next_scene := next_scene_path) -> void:
	_anim_player.play('transisi')
	yield(_anim_player, 'animation_finished')
	
	get_tree().change_scene(_next_scene)
