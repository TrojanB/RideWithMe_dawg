extends Button

@onready var car_slot = $".."
@onready var isSelected = car_slot.isSelected

func _on_pressed():
	if car_slot.isBought:
		Menu.upgrade_car["name"] = car_slot.name
		Menu.upgrade_car["lifes"] = car_slot.lifes
		Menu.upgrade_car["speed"] = car_slot.speed
		Menu.upgrade_car["handling"] = car_slot.handling
		Menu.upgrade_car["carTexture"] = car_slot.txt
