extends Sprite2D

var backgroundSize:float
@export var backgroundSpeed:float = 10

func _ready():
	backgroundSize = texture.get_size().x * scale.x
	
func _process(delta:float):
	position.x -= backgroundSpeed
	if position.x <= -backgroundSize+225:
		position.x += 2 * backgroundSize
