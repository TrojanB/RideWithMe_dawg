extends Button

@onready var money_icon = $MoneyIcon2


func _ready():
	if Menu.lootboxes > 0:
		text = "open " + str(Menu.lootboxes)
		money_icon.visible = false
		alignment = HORIZONTAL_ALIGNMENT_CENTER

func _on_pressed():
	if Menu.lootboxes > 0:
		get_tree().change_scene_to_file("res://loot_boxes.tscn")
	elif Menu.money >= 300:
		Menu.money -= 300
		Menu.lootboxes +=1
		get_tree().change_scene_to_file("res://loot_boxes.tscn")
