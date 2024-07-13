extends Control

@onready var car_slot = $CarSlot

@onready var upgradeBtn = $CarSlot/UpgradeButton
@onready var selectBtn = $CarSlot/SelectButton
@onready var buyBtn = $CarSlot/BuyButton

@onready var carNameLabel = $CarSlot/CarName
@onready var lifesLabel = $CarSlot/Lifes
@onready var speedLabel = $CarSlot/Speed
@onready var handlingLabel = $CarSlot/Handling
@onready var carSprite = $CarSlot/CarSrpite
@onready var card_slots_buttons = $CardSlotsButtons
@onready var card_1 = $Panel/card0
@onready var card_2 = $Panel/card1
@onready var card_3 = $Panel/card2
var card_1_rect
var card_2_rect
var card_3_rect

@onready var panel = $Panel
@onready var scroll_container = $Panel/ScrollContainer
@onready var h_box_container = $Panel/ScrollContainer/HBoxContainer

var isDragging = false

func _ready():
	panel.set_process_unhandled_input(true)
	upgradeBtn.visible = false
	selectBtn.visible = false
	buyBtn.visible = false
	
	carNameLabel.text = Menu.UpgradeCar.name
	lifesLabel.text = str(Menu.UpgradeCar.lifes)
	speedLabel.text = str(Menu.UpgradeCar.speed)
	handlingLabel.text = str(Menu.UpgradeCar.handling)
	carSprite.texture = Menu.UpgradeCar.carTexture
	
	for card_slot_button in card_slots_buttons.get_children():
		card_slot_button.connect("pressed", Callable(self, "_on_card_slot_button_pressed"))


func _on_card_slot_button_pressed():
	panel.visible = true

func _can_drop_data(at_position, data):
	return true 
	
