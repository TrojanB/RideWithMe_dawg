extends Control

var card_index := -1
var upgrade : int = 0
var upgradeType : String

@onready var card = $card
@onready var upgrade_label = $card/upgradeLabel
@onready var upgrade_def = $card/upgradeIcon/upgradeDef
@onready var upgrade_icon = $card/upgradeIcon

func _ready():
	update_card_appearance()

func update_card_appearance():
	card.self_modulate = Menu.rarityColors[upgrade - 1]
	upgrade_label.text = "+" + str(upgrade)
	match upgradeType:
		"turning": 
			upgrade_icon.texture = Menu.turningTexture
			upgrade_def.text = "for turning"
		"speed": 
			upgrade_icon.texture = Menu.speedTexture
			upgrade_def.text = "for speed"
		"lifes": 
			upgrade_icon.texture = Menu.lifesTexture
			upgrade_def.text = "lifes"
