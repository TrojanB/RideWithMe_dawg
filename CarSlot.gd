extends CanvasLayer

@export var car_texture : Texture
@export var carName := "Undefined"
@export var price := 0

@onready var car_model = $ColorRect/CarModel
@onready var car_nameText = $ColorRect/CarName
@onready var priceText = $ColorRect/Button/HBoxContainer/PriceText



func _ready():
	car_model.texture = car_texture
	car_model.hframes = 7
	car_model.vframes = 7
	car_model.frame = 0
	car_nameText.text = carName
	priceText.text = str(price)
