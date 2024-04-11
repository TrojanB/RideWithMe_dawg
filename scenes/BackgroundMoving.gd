extends Sprite2D

var backgroundSize:float
@export var movingSpeed:float = 15

func _ready():
	backgroundSize = texture.get_size().x * scale.x
	
func _process(delta:float):
	position.x -= movingSpeed
	if position.x < -backgroundSize:
		position.x += 2 * backgroundSize
