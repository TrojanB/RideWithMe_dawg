extends HBoxContainer

var car_array = []

func _ready():
	for car_slot in get_children():
		if car_slot.has_node("SelectButton"):
			var select_button = car_slot.get_node("SelectButton")
			var upgrade_button = car_slot.get_node("UpgadeButton")
			select_button.connect("pressed", Callable(self, "_on_SelectButton_pressed").bind(car_slot))
			upgrade_button.connect("pressed", Callable(self, "_on_UpgradeButton_pressed").bind(car_slot))
			car_array.append(car_slot)

func _process(delta):
	var viewport_center = get_viewport().size / 2
	for car_slot in car_array:
		# Oblicz globalną pozycję car_slot
		var car_slot_global_position = car_slot.get_global_position() + Vector2(300,0)
		# Oblicz odległość od środka ekranu
		var distance_to_center = abs(car_slot_global_position.x - viewport_center.x)
		# Zmienna progowa definiująca, kiedy car_slot jest uznawany za środkowy
		var threshold = 150  # Możesz dostosować tę wartość w zależności od potrzeb

		if distance_to_center < threshold:
			car_slot.scale = Vector2(1.25, 1.25)
		else:
			car_slot.scale = Vector2(1, 1)

func _on_SelectButton_pressed(car_slot):
	if not car_slot.isSelected:
		car_slot.isSelected = true
		var SelectButton = car_slot.get_node("SelectButton")
		if SelectButton:
			changeButton(car_slot, true)
		
		for other_car_slot in car_array:
			if other_car_slot != car_slot and other_car_slot.isSelected:
				other_car_slot.isSelected = false
				SelectButton = other_car_slot.get_node("SelectButton")
				if SelectButton:
					changeButton(other_car_slot, false)

func _on_UpgradeButton_pressed(car_slot):
	get_tree().change_scene_to_file("res://scenes/upgrade_scene.tscn")

func changeButton(car_slot, is_selected):
	var select_button = car_slot.get_node("SelectButton")
	if select_button:
		if is_selected:
			select_button.text = "SELECTED"
		else:
			select_button.text = "SELECT"
	
