extends Label

var score:int = 0
var highscore :=0
# Called when the node enters the scene tree for the first time.
func _ready():
	text = "SCORE: 0"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_player_send_speed_to_score(speed):
		score+=speed
		text = "SCORE: " + str(score)

func _on_player_player_has_lost(playerHasLost):
	if score > highscore:
		true
