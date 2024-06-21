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

signal change_isSelected()

# Called when the node enters the scene tree for the first time.
func _ready():
	select_button.connect("pressed", Callable(self, "_on_Button_pressed"))
	
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
	emit_signal("change_isSelected")


func _on_buy_button_pressed():
	if Menu.money >= price:
		Menu.money -= price
		isBought = true
		buy_button.visible = false
		select_button.visible = true
