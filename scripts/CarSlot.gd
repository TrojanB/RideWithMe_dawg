extends Control

@export var isBought := false
@export var isSelected := false
@export var car_name = "skibidi"
@export var price := 100
@export var lifes := 1
@export var speed := 1
@export var handling := 1
@export var txt:Texture

@onready var car_nameLabel = $CarName

@onready var lifesLabel = $Lifes
@onready var speedLabel = $Speed
@onready var handlingLabel  = $Handling

@onready var buy_button = $BuyButton
@onready var select_button = $SelectButton
@onready var upgrade_button = $UpgradeButton

@onready var car_srpite = $CarSrpite

# Called when the node enters the scene tree for the first time.
func _ready():
	car_nameLabel.text = car_name
	lifesLabel.text = str(lifes)
	speedLabel.text = str(speed)
	handlingLabel.text = str(handling)
	buy_button.text = str(price)
	car_srpite.texture = txt
	
	if car_name == Menu.player_data.PlayerCar.name:
		select_button.text = "SELECTED"
	
	if isBought:
		buy_button.visible = false
		select_button.visible = true
		upgrade_button.visible = true
	else:
		buy_button.visible = true
		select_button.visible = false
		upgrade_button.visible = false

func _on_buy_button_pressed():
	if Menu.player_data.money >= price:
		Menu.player_data.money -= price
		if not Menu._has_car(car_name, Menu.player_data.owned_cars):
			var car = Menu._find_car(car_name, Menu.player_data.cars)
			if car:
				Menu.player_data.owned_cars.append(car)
				buy_button.visible = false
				select_button.visible = true
				print("HURA")


func _on_select_button_pressed():
	if car_name != Menu.player_data.PlayerCar.name:
		var car = Menu._find_car(car_name, Menu.player_data.owned_cars)
		if car:
			Menu.player_data.PlayerCar = car
			select_button.text = "SELECTED"
		else:
			print("ERROR, COULDNT ASIGN CAR")

