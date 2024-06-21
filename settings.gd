extends Control

var sfx_index = AudioServer.get_bus_index("sfx")
var music_index = AudioServer.get_bus_index("music")

func _ready():
	visible = false

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(music_index, value)

func _on_button_pressed():
	visible = false


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_index, value)
