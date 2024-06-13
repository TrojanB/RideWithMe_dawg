extends Label

@onready var money := 0
@onready var animation_player = $MoneyIcon/AnimationPlayer
var index = 0;

func _on_score_add_coin():
	index+=1
	print(index)
	money+=1
	text = str(money)
	animation_player.play("collectedCoin")
	Menu.money += 1
