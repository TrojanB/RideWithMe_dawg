extends Label

var score:int = 0
var moneyInverval = 500
var moneyX = 0
var highscore = Menu.highscore

signal addCoin()

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "SCORE: 0"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_player_send_speed_to_score(speed):
		score+=speed
		if moneyX < moneyInverval:
			moneyX+=speed
		else:
			moneyX = 0
			emit_signal("addCoin")
			
		text = "SCORE: " + str(score)


func _on_player_player_has_lost(playerHasLost):
	if Menu.highscore < score:
		Menu.highscore = score
