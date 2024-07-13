extends Node2D

var rng = RandomNumberGenerator.new()
var hasPlayerLost = false
@onready var gameOverScreen = $CanvasLayer/Control
@onready var transitionPlayer = $Sprite2D/AnimationPlayer
@onready var timer = $CanvasLayer/HBoxContainer/UI/DestroyTime/DestroyTimer
var transition = "PixelOut"

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

var spawnDelays = [5,4,3,2.5, 1.5, 1.25, 1.2]
var destroySpawnDelays = [3,3.5,4.5,5,6,7,8]
var index = 0
var timeCounter = 0

@onready var game_mode = Menu.gameMode

func _ready():
	if game_mode == Menu.gameModes.NORMAL:
		_normal_mode()
	else:
		_destroy_mode()
	
func _process(delta):
	timeCounter += delta
	if game_mode == Menu.gameModes.NORMAL:
		if timeCounter >= spawnDelays[index] and not hasPlayerLost:
			spawn_car()
			spawn_car()
			spawn_car()
			timeCounter = 0
	else:
		if timeCounter >= destroySpawnDelays[index] and not hasPlayerLost:
			spawn_car()
			timeCounter = 0
		
func spawn_car():
	var car = cars[rng.randi_range(0, len(cars)-1)].instantiate()
	add_child(car)
	car.position.x = rng.randi_range(min_posX, max_posX)
	car.position.y = lanesPositionsY[rng.randi_range(0,len(cars)-1)]
	car.speed = rng.randi_range(min_speed, max_speed)


func _on_player_player_has_lost(playerHasLost):
	hasPlayerLost = true
	gameOverScreen.visible = true
	timer.stop()


func _on_player_speed_changed(speed):
	if game_mode == Menu.gameModes.NORMAL:
		if index+1 < len(spawnDelays) and not hasPlayerLost:
			index+=1
	else:
		if index+1 <=len(destroySpawnDelays)  and not hasPlayerLost:
			index+=1

func _normal_mode():
	spawn_car()
	spawn_car()
	spawn_car()

func _destroy_mode():
	timer.start()


