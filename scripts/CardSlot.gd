extends TextureRect

@export var slot_index := -1

func _ready():
	pass
	
func _drop_data(at_position, index):
	print("WUUUHUUUU")
	Menu.UpgradeCar.cards.append(Menu.cards[index])
	
