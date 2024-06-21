extends Button

@onready var car_slot = $".."
@onready var isSelected = car_slot.isSelected

func _on_pressed():
	if car_slot.isBought:
		Menu.carTexture = car_slot.txt
		Menu.lifes = car_slot.lifes
		Menu.speedMultiplier = car_slot.speed
		Menu.handling = car_slot.handling
