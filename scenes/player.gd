extends CharacterBody2D

var speeds = [900, 1800, 2700, 3600, 4500]
var speedMultipliers = [1, 1, 1.5 ,2 , 2.5, 3]
var handlings = [250, 350, 450, 550, 700]

var speedMultiplier = speedMultipliers[Menu.PlayerCar.speed]
var handling = handlings[Menu.PlayerCar.handling]
var lifes = Menu.PlayerCar.lifes
var is_immortal = false

var intervals = [20,40,80,120]
var index = 0
var timeCounter:float = 0

@export var current_speed:float = speeds[0] * speedMultiplier
var previous_speed:float

signal sendSpeedToScore(speed:float)
signal speed_changed(speed:float)
signal player_hit(lifes:int)

@onready var timer = $Timer
@onready var animation:AnimationPlayer = $AnimationPlayer
@onready var collisionAnimation = $Collision
@onready var level = $".."

var start_turning_up = false
var start_turning_down = false

signal playerHasLost(playerHasLost:bool)
var playerLost = false

func _ready():
	speed_changed.emit(current_speed)
	if Menu.PlayerCar.carTexture:
		$Sprite2D.texture = Menu.PlayerCar.carTexture
	$Sprite2D.frame = 0

func _physics_process(delta):
	if Input.get_action_strength("up") and position.y > 96:  #go up
		animation_up()
		position -= Vector2(0,handling) * delta
		
	elif Input.get_action_strength("down") and position.y < 452:#go down
		animation_down()
		position += Vector2(0,handling) * delta
		
	else:                                  #go straight
		animation.play("idle")
		start_turning_down = false
		start_turning_up = false
		
	if current_speed != previous_speed: #wysyla predkosc do Sprite'ow drogi by ta "ruszala sie" w wyslanej predkosci lmao
		speed_changed.emit(current_speed)
		previous_speed = current_speed

func _process(delta):
	sendSpeedToScore.emit(round(current_speed/1000))
	if index < len(intervals) and not playerLost:
		timeCounter += delta
		if timeCounter >= intervals[index]:
			index+=1
			smooth_speed_change(speeds[index] * speedMultiplier, delta)

func animation_up():
	if start_turning_up == false:
		start_turning_up = true
		start_turning_down = false
		animation.play("go_up")
		

func animation_down():
	if start_turning_down == false:
		start_turning_down = true
		start_turning_up = false
		animation.play("go_down")
	
func smooth_speed_change(speed:float,delta):
	while current_speed <= speed:
		wait(delta)
		current_speed+=1
		
func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout


func _on_area_2d_area_entered(car):
	if not is_immortal:
		lifes -=1 
		player_hit.emit(lifes)
		is_immortal = true
		timer.start()
		animation.play("flashing")
		if lifes <= 0:  #Jesli gracz stracil wysztkie zycia przegrywa 
			current_speed = 0
			previous_speed = 0
			speed_changed.emit(current_speed)
			collisionAnimation.play("collision")
			playerLost = true
			
			if level:
				for item in level.get_children():
					if item.has_method("stop_car"):
						item.stop_car()
						playerHasLost.emit(true)

func _on_timer_timeout():
	is_immortal = false
	animation.play("RESET")
