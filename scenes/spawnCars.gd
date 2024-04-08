extends Node2D

var rng = RandomNumberGenerator.new()

var cars = [
	preload("res://Enemies/ambulance.tscn"),
	preload("res://Enemies/black_minivan.tscn"),
	preload("res://Enemies/blue_wagon.tscn"),
	preload("res://Enemies/green_minivan.tscn"),
	preload("res://Enemies/red_wagon.tscn"),
	preload("res://Enemies/white_minivan.tscn"),
	preload("res://Enemies/yellow_minivan.tscn")
]

var min_speed = 3
var max_speed = 10

var min_posX = 2000
var max_posX = 3000

var lanesPositionsY = [  #od gory do dolu
	72, 144, 216, 288, 360, 432
]

var spawnDelay = 2
var timeCounter = 0

func _ready():
	spawn_car()
	spawn_car()
	spawn_car()
	
func _process(delta):
	timeCounter += delta
	if timeCounter >= spawnDelay:
		spawn_car()
		timeCounter = 0
func spawn_car():
	var car = cars[rng.randi_range(0, len(cars)-1)].instantiate()
	add_child(car)
	car.position.x = rng.randi_range(min_posX, max_posX)
	car.position.y = lanesPositionsY[rng.randi_range(0,5)]
	car.speed = rng.randi_range(min_speed, max_speed)
