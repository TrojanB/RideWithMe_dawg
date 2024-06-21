extends Button

@export var settings : Control

func _ready():
	if settings:
		settings.visible = false


func _on_pressed():
	settings.visible = true
