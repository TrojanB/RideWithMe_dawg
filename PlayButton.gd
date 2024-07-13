extends Button
@onready var control = $".."
var select_game_mode = preload("res://scenes/select_game_mode.tscn")

func _on_pressed():
	var scene = select_game_mode.instantiate()
	scene.z_index = 30
	scene.scale = Vector2(1.01, 1.01)
	control.add_child(scene)
	scene.position -= Vector2(5,5)
	var panel = scene.get_node("Panel")
	panel.self_modulate.a = 1.4
