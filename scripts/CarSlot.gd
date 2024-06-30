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
@onready var car_srpite = $CarSrpite



var car = Car.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	car.name = car_name
	car.lifes = lifes
	car.speed = speed
	car.handling = handling
	car.carTexture = txt
	
	car_nameLabel.text = car_name
	lifesLabel.text = str(lifes)
	speedLabel.text = str(speed)
	handlingLabel.text = str(handling)
	buy_button.text = str(price)
	car_srpite.texture = txt
	
	if isBought:
		buy_button.visible = false
		select_button.visible = true
	else:
		buy_button.visible = true
		select_button.visible = false

func _on_Button_pressed():
	if isBought:
		Menu.PlayerCar = car


func _on_buy_button_pressed():
	if Menu.money >= price:
		Menu.money -= price
		isBought = true
		buy_button.visible = false
		select_button.visible = true


func _on_select_button_pressed():
	if isBought:
		Menu.PlayerCar = car


func _on_upgade_button_pressed():
	if isBought:
		Menu.UpgradeCar = car
