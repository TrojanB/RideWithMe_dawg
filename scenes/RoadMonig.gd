extends Sprite2D

var roadSize:float
@export var roadSpeed:float
var Player:CharacterBody2D

func _ready():
	roadSize = texture.get_size().x * scale.x
	
func _process(delta:float):
	position.x -= roadSpeed
	if position.x < -roadSize:
		position.x += 2 * roadSize


func _on_player_speed_changed(speed):
	roadSpeed = speed
	print(roadSpeed)
