extends Button

@export var scene : String

func _on_pressed():
	get_tree().change_scene_to_file(scene)
