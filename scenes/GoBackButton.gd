extends Button

@onready var panel = $".."
@onready var card_slots_buttons = $"../../CardSlotsButtons"


func _on_pressed():
	panel.visible = false
	card_slots_buttons.visible = true
