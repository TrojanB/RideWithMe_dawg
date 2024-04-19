extends Sprite2D

var backgroundSize:float
@export var backgroundSpeed:float = 10
@export var spriteAmount = 2
var isCitySprite = false

func _ready():
	backgroundSize = texture.get_size().x * scale.x
	if name == "city" or "city2" or "city3":
		isCitySprite = true
	
func _process(delta:float):
	position.x -= backgroundSpeed
	if position.x <= -backgroundSize + 255 :
		if isCitySprite:
			position.x += spriteAmount * backgroundSize
		else:
			position.x += spriteAmount * backgroundSize
