extends Label

@onready var money := 0
@onready var money_icon = $MoneyIcon
@onready var animation_player = $MoneyIcon/AnimationPlayer
var length = 0

func _on_score_add_coin():
	Menu.money += 1
	money+=1
	ui_update()

func ui_update():
	text = str(money)
	if length < text.length():
		length+=1
		money_icon.position.x += 18
	animation_player.play("collectedCoin")


func _on_player_player_has_destroyed_car():
	money+=1
	ui_update()
