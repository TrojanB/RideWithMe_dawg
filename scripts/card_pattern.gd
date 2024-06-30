extends Control

var upgrade : int
var upgradeType : int

@onready var card = $card
@onready var upgrade_label = $card/upgradeLabel
@onready var upgrade_def = $card/upgradeIcon/upgradeDef
@onready var upgrade_icon = $card/upgradeIcon

func _ready():
	self_modulate = Menu.rarityColors[upgrade-1]
	upgrade_def.text = "+" + str(upgrade + 1)
	match upgradeType:
		0: 
			upgrade_icon.texture = Menu.turningTexture
			upgrade_def.text = "for turning"
		1: 
			upgrade_icon.texture = Menu.speedTexture
			upgrade_def.text = "for speed"
		2: 
			upgrade_icon.texture = Menu.lifesTexture
			upgrade_def.text = "lifes"
