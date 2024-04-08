extends Sprite2D

var speed:float = 5
var carSprite
var carFrame = 24

func _ready():
	scale.x = 1.9
	scale.y = 1.9
func _physics_process(delta):
	position += Vector2(-speed,0)
