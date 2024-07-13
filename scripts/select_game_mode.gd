extends Control

@onready var normal_mode_button = $Panel/NormalMode/Description/NormalModeButton
@onready var destroy_mode_button = $Panel/DestroyMode/Description/DestroyModeButton
@onready var panel = $Panel



func _on_normal_mode_button_pressed():
	Menu.gameMode = Menu.gameModes.NORMAL
	_change_to_level()

func _on_destroy_mode_button_pressed():
	Menu.gameMode = Menu.gameModes.DESTROY
	_change_to_level()

func _change_to_level():
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_go_back_button_pressed():
	queue_free()
