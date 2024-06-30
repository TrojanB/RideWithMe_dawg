extends Control

@export var car_slotPosition : Vector2
@export var car_scale : Vector2

@onready var car_slot = $CarSlot

@onready var upgradeBtn = $CarSlot/UpgadeButton
@onready var selectBtn = $CarSlot/SelectButton
@onready var buyBtn = $CarSlot/BuyButton

@onready var carNameLabel = $CarSlot/CarName
@onready var lifesLabel = $CarSlot/Lifes
@onready var speedLabel = $CarSlot/Speed
@onready var handlingLabel = $CarSlot/Handling
@onready var carSprite = $CarSlot/CarSrpite

func _ready():
	upgradeBtn.visible = false
	selectBtn.visible = false
	buyBtn.visible = false
	
	carNameLabel.text = Menu.UpgradeCar.name
	lifesLabel.text = str(Menu.UpgradeCar.lifes)
	speedLabel.text = str(Menu.UpgradeCar.speed)
	handlingLabel.text = str(Menu.UpgradeCar.handling)
	carSprite.texture = Menu.UpgradeCar.carTexture
	
