extends Label

func _ready():
	if Menu.gameMode == Menu.gameModes.DESTROY:
		visible = false
	text = str(Menu.player_data.PlayerCar.lifes)

func _on_player_player_hit(lifes):
	text = str(lifes)
