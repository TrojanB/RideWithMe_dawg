extends Sprite2D

var backgroundSize:float
@export var backgroundSpeed:float
@export var spriteAmount = 2
var isCitySprite = false

func _ready():
	backgroundSize = texture.get_size().x * scale.x
	if name == "city" or "city2" or "city3":
		isCitySprite = true
	
#Przesuwa tla, kiedy jeden background przekroczy granice wraca na poczatek
func _process(delta:float):
	position.x -= backgroundSpeed * delta
	if position.x < -backgroundSize:
		if isCitySprite:
			position.x += spriteAmount * backgroundSize
		else:
			position.x += backgroundSize - 100

func _on_player_player_has_lost(playerHasLost):
	if isCitySprite:
		backgroundSpeed = 0
