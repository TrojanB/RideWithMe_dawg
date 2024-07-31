extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str( Menu.player_data.highscore)
