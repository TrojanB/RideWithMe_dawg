extends Control

@onready var high_score = $HighScore
var highscore := 0
var destroy_highscore := 0
var money := 2000
var lootboxes := 5
var cars = []
var owned_cars = []
var cards = []

var luxury_cars = {
	"black_luxury":     preload("res://PlayerCars/LUXURY_GAME/Black_LUXURY_CLEAN_All_000-sheet.png"),
	"green_luxury":     preload("res://PlayerCars/LUXURY_GAME/Green_LUXURY_CLEAN_All_000-sheet.png"),
	"red_luxury":       preload("res://PlayerCars/LUXURY_GAME/White_LUXURY_CLEAN_All_000-sheet.png"),
	"white_luxury":     preload("res://PlayerCars/LUXURY_GAME/White_LUXURY_CLEAN_All_000-sheet.png"),
	"yellow_luxury":    preload("res://PlayerCars/LUXURY_GAME/Yellow_LUXURY_CLEAN_All_000-sheet.png")
}
var muscle_cars = {
	"black_musclecar":  preload("res://PlayerCars/MUSCLE_CAR_GAME/Black_MUSCLECAR_CLEAN_All_000-sheet.png"),
	"blue_musclecar" :  preload("res://PlayerCars/MUSCLE_CAR_GAME/Blue_MUSCLECAR_CLEAN_All_000-sheet.png"),
	"green_musclecar":  preload("res://PlayerCars/MUSCLE_CAR_GAME/Green_MUSCLECAR_CLEAN_All_000-sheet.png"),
	"red_musclecar":    preload("res://PlayerCars/MUSCLE_CAR_GAME/Red_MUSCLECAR_CLEAN_All_000-sheet.png"),
	"white_musclecar":  preload("res://PlayerCars/MUSCLE_CAR_GAME/White_MUSCLECAR_CLEAN_All_000-sheet.png"),
	"yellow_musclecar": preload('res://PlayerCars/MUSCLE_CAR_GAME/Yellow_MUSCLECAR_CLEAN_All_000-sheet.png'),
}
var sedan_cars = {
	"black_sedan":  preload("res://PlayerCars/SEDAN_GAME/Black_SEDAN_CLEAN_All_000-sheet.png"),
	"blue_sedan":   preload("res://PlayerCars/SEDAN_GAME/Blue_SEDAN_CLEAN_All_000-sheet.png"),
	"green_sedan":  preload("res://PlayerCars/SEDAN_GAME/Blue_SEDAN_CLEAN_All_000-sheet.png"),
	"red_sedan":    preload("res://PlayerCars/SEDAN_GAME/Red_SEDAN_CLEAN_All_000-sheet.png"),
	"white_sedan":  preload("res://PlayerCars/SEDAN_GAME/White_SEDAN_CLEAN_All_000-sheet.png"),
	"yellow_sedan": preload("res://PlayerCars/SEDAN_GAME/Yellow_SEDAN_CLEAN_All_000-sheet.png")
}
var sport_cars = {
	"black_sport":  preload("res://PlayerCars/SPORT_GAME/Black_SPORT_CLEAN_All_000-sheet.png"),
	"blue_sport":   preload("res://PlayerCars/SPORT_GAME/Blue_SPORT_CLEAN_All_000-sheet.png"),
	"green_sport":  preload("res://PlayerCars/SPORT_GAME/Green_SPORT_CLEAN_All_000-sheet.png"),
	"red_sport":    preload("res://PlayerCars/SPORT_GAME/Red_SPORT_CLEAN_All_000-sheet.png"),
	"white_sport":  preload("res://PlayerCars/SPORT_GAME/White_SPORT_CLEAN_All_000-sheet.png"),
	"yellow_sport": preload("res://PlayerCars/SPORT_GAME/Yellow_SPORT_CLEAN_All_000-sheet.png")
}

var PlayerCar : Car
var UpgradeCar : Car

var upgrades = [1,2,3,4]
var upgradeTypes = ["turning", "speed", "lifes"]
var rarityColors = [Color(0.483, 0.751, 0.231), Color(0.292, 0.717, 0.891), Color(0.685, 0.291, 0.833), Color(0.929, 0.708, 0.161)]

var turningTexture : Texture
var speedTexture : Texture
var lifesTexture : Texture

enum gameModes {
	NORMAL,
	DESTROY
}

var gameMode = gameModes.NORMAL

func _ready():
	var sedan_car = Car.new("SEDAN", 1,1,1, sedan_cars["white_sedan"], [], 0)
	var muscle_car = Car.new("MUSCLE", 1,2,2, muscle_cars["black_musclecar"], [], 150)
	var luxury_car = Car.new("LUXURY", 2,3,4, luxury_cars["white_luxury"], [], 500)
	var sport_car = Car.new("SPORT", 1,3,3, sport_cars["white_sport"], [], 1500)
	
	cars.append_array([muscle_car])
	owned_cars.append_array([sedan_car, luxury_car, sport_car])
	
	PlayerCar = sedan_car
	
	turningTexture = preload("res://Textures/Icons/SteeringWheelIcon.png")
	speedTexture = preload("res://Textures/Icons/speedIcon.png")
	lifesTexture = preload("res://Textures/Icons/heartIcon.png")

func _find_car(car_name: String, cars: Array):
	for car in cars:
		if car.name == car_name:
			return car
	return null

func _has_car(car_name: String, cars:Array):
	for car in cars:
		if car.name == car_name:
			return true
	return false
