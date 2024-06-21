extends Control

@onready var touch_screen_button = $LootBox/TouchScreenButton
@onready var animation_player = $LootBox/TouchScreenButton/AnimationPlayer

@onready var card_pattern = $LootBox/CardPattern/card
@onready var upgradeTexture = $LootBox/CardPattern/card/upgradeIcon
@onready var upgradeLabel = $LootBox/CardPattern/card/upgradeLabel
@onready var upgradeDef =  $LootBox/CardPattern/card/upgradeIcon/upgradeDef
@onready var animation_player_card = $LootBox/CardPattern/AnimationPlayerCard

@export var turningTexture : Texture
@export var speedTexture : Texture
@export var lifesTexture : Texture

enum rarities {
	COMMON,
	UNCOMMON,
	EPIC,
	LEGENDARY
}

var upgrades = [1,2,3,4]
var upgradeTypes = ["turning", "speed", "lifes"]
var rarityColors = [Color(0.483, 0.751, 0.231), Color(0.292, 0.717, 0.891), Color(0.685, 0.291, 0.833), Color(0.929, 0.708, 0.161)]

func _on_touch_screen_button_pressed():
	animation_player.play("openLootBox")
	animation_player_card.play("popUp")
	createLoot()

func createLoot():
	card_pattern.visible = true
	var card = UpgradeCard.new()
	var rand1 = randi_range(1,100)
	var rarity : int 
	var upgradeType = randi() % upgradeTypes.size()
	
	if rand1 <= 60 : rarity = 0
	elif rand1 > 60 and rand1 <= 80 : rarity = 1
	elif rand1 > 80 and rand1 <=90 : rarity = 2
	else : rarity = 3
	
	card.upgrade = upgrades[rarity] + 1
	card.upgradeType = upgradeTypes[upgradeType]
	
	card_pattern.self_modulate = rarityColors[rarity]
	upgradeLabel.text = "+" + str(rarity + 1)
	
	match upgradeType:
		0: 
			upgradeTexture.texture = turningTexture
			upgradeDef.text = "for turning"
		1: 
			upgradeTexture.texture = speedTexture
			upgradeDef.text = "for speed"
		2: 
			upgradeTexture.texture = lifesTexture
			upgradeDef.text = "lifes"
