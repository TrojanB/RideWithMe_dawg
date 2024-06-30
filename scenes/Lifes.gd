extends Label

func _ready():
	text = str(Menu.PlayerCar.lifes)

func _on_player_player_hit(lifes):
	text = str(lifes)
