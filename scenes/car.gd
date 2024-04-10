extends Sprite2D

var speed:float = 5
var carSprite
var carFrame = 5

func _ready():
	scale.x = 1.9
	scale.y = 1.9
	frame = 0
func _physics_process(delta):
	position += Vector2(-speed,0)
