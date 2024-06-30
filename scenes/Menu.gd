extends Control

@onready var high_score = $HighScore
var highscore := 0
var money := 300
var lootboxes := 5
var cars = []
var cards = []

var PlayerCar : Car
var UpgradeCar : Car

var upgrades = [1,2,3,4]
var upgradeTypes = ["turning", "speed", "lifes"]
var rarityColors = [Color(0.483, 0.751, 0.231), Color(0.292, 0.717, 0.891), Color(0.685, 0.291, 0.833), Color(0.929, 0.708, 0.161)]

@export var turningTexture : Texture
@export var speedTexture : Texture
@export var lifesTexture : Texture
