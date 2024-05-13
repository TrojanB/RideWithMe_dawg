extends Control

@onready var transitionPlayer = $AnimationPlayer

func _on_play_again_button_pressed():
	transitionPlayer.play("fade_in")
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_main_menu_button_pressed():
	transitionPlayer.play("fade_in")
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
