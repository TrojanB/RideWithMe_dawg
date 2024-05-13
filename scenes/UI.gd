extends Control

@onready var up = $Up
@onready var down = $Down


func _on_up_pressed():
	up.self_modulate.a8 = 144


func _on_up_released():
	up.self_modulate.a8 = 210


func _on_down_pressed():
	down.self_modulate.a8 = 144


func _on_down_released():
	down.self_modulate.a8 = 210
