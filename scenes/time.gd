extends Label

var playerLost:bool = false
var time_passed:float = 0

func _ready():
	set_process(true)

func _process(delta):
	if not playerLost:
		time_passed += delta
		update_label()

func update_label():
	var total_milliseconds = int(time_passed * 100)
	var minutes = int(total_milliseconds / (60 * 100))
	var seconds = int((total_milliseconds / 100) % 60)
	var milliseconds = total_milliseconds % 100
	text = "TIME: " + str(minutes) + ":" + str(seconds) + "." + str(milliseconds)

func _on_player_player_has_lost(playerHasLost):
	playerLost = true
