extends Resource
class_name Car

var name := "[undefined]"
var lifes := 1
var speed := 0
var handling := 0
var carTexture : Texture
var cards = [null, null, null]
var price := 0

func _init(_name: String = "[undefined]", _lifes: int = 1, _speed: int = 1, _handling: int = 1, _texture: Texture = Menu.lifesTexture, _cards: Array = [], _price: int = 0):
	name = _name
	lifes = _lifes
	speed = _speed
	handling = _handling
	carTexture = _texture
	cards = _cards
	price = _price

func add_card(card):
	cards.append(card)

func remove_card(card):
	cards.erase(card)

func find_empty_space():
	if cards[0] == null:
		return 0
	elif cards[1] == null:
		return 1
	elif cards[2] == null:
		return 2
	return null
