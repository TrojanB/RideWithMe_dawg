extends Control

@onready var touch_screen_button = $LootBox/TouchScreenButton
@onready var animation_player = $LootBox/TouchScreenButton/AnimationPlayer

@onready var card_pattern = $LootBox/CardPattern/card
@onready var upgradeTexture = $LootBox/CardPattern/card/upgradeIcon
@onready var upgradeLabel = $LootBox/CardPattern/card/upgradeLabel
@onready var upgradeDef =  $LootBox/CardPattern/card/upgradeIcon/upgradeDef
@onready var animation_player_card = $LootBox/CardPattern/AnimationPlayerCard


var tab = [10,20,30,50,80,90,100,150,130]

enum rarities {
	COMMON,
	UNCOMMON,
	EPIC,
	LEGENDARY
}

func _on_touch_screen_button_pressed():
	if Menu.lootboxes > 0:
		Menu.lootboxes -= 1
		animation_player.play("openLootBox")
		animation_player_card.play("popUp")
		createLoot()
	else:
		get_tree().change_scene_to_file("res://scenes/Menu.tscn")

func createLoot():
	card_pattern.get_parent().visible = true
	var rand1 = randi_range(1,100)
	var rarity : int 
	var upgradeType = randi() % Menu.upgradeTypes.size()
	
	if rand1 <= 55 : rarity = 0
	elif rand1 > 55 and rand1 <= 80 : rarity = 1
	elif rand1 > 80 and rand1 <=95 : rarity = 2
	else : rarity = 3
	
	var card = UpgradeCard.new()
	card.upgrade = Menu.upgrades[rarity] + 1
	card.upgradeType = Menu.upgradeTypes[upgradeType]
	Menu.cards.append(card)
	
	card_pattern.self_modulate = Menu.rarityColors[rarity]
	upgradeLabel.text = "+" + str(rarity + 1)
	
	match upgradeType:
		0: 
			upgradeTexture.texture = Menu.turningTexture
			upgradeDef.text = "for turning"
		1: 
			upgradeTexture.texture = Menu.speedTexture
			upgradeDef.text = "for speed"
		2: 
			upgradeTexture.texture = Menu.lifesTexture
			upgradeDef.text = "lifes"
