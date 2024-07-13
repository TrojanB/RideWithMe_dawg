extends Label

@onready var timer = $DestroyTimer
@onready var animation_player = $AnimationPlayer

var time_running_out := 10
var is_time_running_out = false
signal ChangeTimeAnimation
var time := 0
var add_destroy_time := 5

func _ready():
	update_destroy_label()

func _process(delta):
	update_destroy_label()

func update_destroy_label():
	time = int(timer.time_left)
	text = str(time) + "s"
	if time <= 10 and not is_time_running_out:
		is_time_running_out = true
		ChangeTimeAnimation.emit()
	elif time > 10 and is_time_running_out:
		is_time_running_out = false
		ChangeTimeAnimation.emit()

func _on_change_time_animation():
	if is_time_running_out:
		animation_player.play("time_is_running_out")
	else:
		animation_player.play("RESET")


func _on_player_player_has_destroyed_car():
	var remaining_time = timer.time_left
	if remaining_time + add_destroy_time > 30:
		timer.stop()
		timer.start(31)
	else:
		timer.stop()
		timer.start(remaining_time + add_destroy_time)
	
