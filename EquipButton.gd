extends Button

@onready var car_slot = $".."
@onready var isSelected = car_slot.isSelected

func _on_pressed(car):
	if car_slot.isBought:
		Menu.PlayerCar = car
