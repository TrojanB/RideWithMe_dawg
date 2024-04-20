extends Node2D

var rng = RandomNumberGenerator.new()
var hasPlayerLost = false

var cars = [
	preload("res://Enemies/black_minivan.tscn"),
	preload("res://Enemies/blue_wagon.tscn"),
	preload("res://Enemies/green_minivan.tscn"),
	preload("res://Enemies/red_wagon.tscn"),
	preload("res://Enemies/white_minivan.tscn"),
	preload("res://Enemies/yellow_minivan.tscn")
]

var min_speed = 400
var max_speed = 1200

var min_posX = 2000
var max_posX = 3000

var lanesPositionsY = [  #od gory do dolu
	72, 144, 216, 288, 360, 432
]

var spawnDelays = [5,4,3,2.5, 1.5, 1, 0.5]
var index = 0
var timeCounter = 0

func _ready():
	spawn_car()
	spawn_car()
	spawn_car()
	
func _process(delta):
	timeCounter += delta
	if timeCounter >= spawnDelays[index] and not hasPlayerLost:
		spawn_car()
		spawn_car()
		spawn_car()
		timeCounter = 0
		
func spawn_car():
	var car = cars[rng.randi_range(0, len(cars)-1)].instantiate()
	add_child(car)
	car.position.x = rng.randi_range(min_posX, max_posX)
	car.position.y = lanesPositionsY[rng.randi_range(0,len(cars)-1)]
	car.speed = rng.randi_range(min_speed, max_speed)


func _on_player_player_has_lost(playerHasLost):
	hasPlayerLost = playerHasLost


func _on_player_speed_changed(speed):
	if index+1 <= len(spawnDelays) and not hasPlayerLost:
		index+=1
		print(spawnDelays[index])
