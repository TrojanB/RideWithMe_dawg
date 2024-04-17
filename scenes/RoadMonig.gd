extends Sprite2D

var roadSize:float
@export var roadSpeed:float

var Player:CharacterBody2D
var hasPlayerLost = false

func _ready():
	roadSize = texture.get_size().x * scale.x
	
func _process(delta:float):
	position.x -= roadSpeed
	if position.x < -roadSize and not hasPlayerLost:
		position.x += 2 * roadSize


func _on_player_speed_changed(speed):
	roadSpeed = speed


func _on_player_player_has_lost(playerHasLost):
	playerHasLost = true
	roadSpeed = 0
