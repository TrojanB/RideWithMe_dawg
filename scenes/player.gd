extends CharacterBody2D


@export var current_speed:float = 5
var previous_speed:float
var speeds = [20, 30, 20, 25]
var intervals = [5,10,15,20]
var index = 0
var timeCounter:float = 0
signal speed_changed(speed:float)

@onready var animation:AnimationPlayer = $AnimationPlayer

var start_turning_up = false
var start_turning_down = false

func _ready():
	speed_changed.emit(current_speed)

func _physics_process(delta):
	if Input.get_action_strength("up"):  #go up
		animation_up()
		position -= Vector2(0,5)
		
	elif Input.get_action_strength("down") :#go down
		animation_down()
		position += Vector2(0,5) 
		
	else:                                  #go straight
		animation.play("idle")
		start_turning_down = false
		start_turning_up = false
		
	if current_speed != previous_speed: #wysyla predkosc do Sprite'ow drogi by ta "ruszala sie" w wyslanej predkosci lmao
		speed_changed.emit(current_speed)
		previous_speed = current_speed
		
func _process(delta):
	if index < len(intervals):
		timeCounter += delta
		if timeCounter >= intervals[index]:
			smooth_speed_change(speeds[index])
func animation_up():
	if start_turning_up == false:
		print("yoo")
		start_turning_up = true
		start_turning_down = false
		animation.play("go_up")
		
func animation_down():
	if start_turning_down == false:
		start_turning_down = true
		start_turning_up = false
		animation.play("go_down")
	
func smooth_speed_change(speed:float):
	while current_speed <= speed:
		wait(1)
		current_speed+=1
		
func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
