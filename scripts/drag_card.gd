extends Control

var upgrade = 0
var upgradeType : String
var dragging = false

func _ready():
	set_process_unhandled_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if  get_rect().has_point(event.position):
				dragging = true
		else:
			dragging = false

	if event is InputEventScreenTouch:
		if event.pressed:
			if get_rect().has_point(event.position):
				dragging = true
		else:
			dragging = false

	if event is InputEventMouseMotion or event is InputEventScreenDrag:
		if dragging:
			global_position = event.position - get_rect().size/6
