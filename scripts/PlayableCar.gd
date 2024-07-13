class_name Car

var name := "[undefined]"
var lifes := 1
var speed := 0
var handling := 0
var carTexture : Texture
var cards = [null, null, null]
var price := 0

func _init(_name: String, _lifes: int, _speed: int, _handling: int, _texture: Texture, _cards: Array, _price: int):
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
