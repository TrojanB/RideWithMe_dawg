extends Control

@export var car_name = "skibidi"
@export var price := 100
@export var lifes := 1
@export var speed := 1
@export var txt:Texture

@onready var car_nameLabel = $CarName
@onready var lifesLabel = $Lifes
@onready var speedLabel = $Speed
@onready var button = $Button
@onready var car_srpite = $CarSrpite


# Called when the node enters the scene tree for the first time.
func _ready():
	car_nameLabel.text = car_name
	lifesLabel.text = str(lifes)
	speedLabel.text = str(speed)
	button.text = str(price)
	car_srpite.texture = txt
