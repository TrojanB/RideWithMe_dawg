extends Panel

var card_pattern = preload("res://scenes/card_pattern.tscn")
@onready var h_box_container = $ScrollContainer/MarginContainer/HBoxContainer

var drag_offset
var duplicate

var idx = 0

func _ready():
	
	for idx in range(len(Menu.player_data.cards)):
		var index = idx
		var card = Menu.player_data.cards[index]
		create_card(card, index)
	
	for card in h_box_container.get_children():
		card.connect("_input", Callable(self, "_on_gui_input").bind(card))

func _on_gui_input(event, card):
	print("ON GUI INPUT")
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		if event.pressed:
			start_dragging(card,event.position)
		else:
			print(event.position)
	elif (event is InputEventMouseMotion or event is InputEventScreenDrag):
		print(event.position)
		drag_card(event.position)

func create_card(card : UpgradeCard, index : int):
	var new_card = card_pattern.instantiate()
	new_card.card_index = index
	new_card.upgrade = card.upgrade
	new_card.upgradeType = card.upgradeType
	new_card.custom_minimum_size = Vector2(150,250)
	new_card.scale = Vector2(0.5,0.5)
	h_box_container.add_child(new_card)

func start_dragging(card, event_position):
	print("STARTED DRAGGING")
	duplicate = card.duplicate()
	drag_offset = card.get_rect().size * card.scale / 2
	duplicate.scale = Vector2(1,1)
	duplicate.z_index = 5
	add_child(duplicate)
	
	duplicate.position = card.global_position

func drag_card(event_position):
	print("WHHATA")
	if duplicate:
		duplicate.position = event_position - drag_offset

func _input(event):
	if (event is InputEventMouseMotion or event is InputEventScreenDrag) and duplicate:
		drag_card(event.position)
