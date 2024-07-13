extends HBoxContainer

var space_filler = preload("res://filler.tscn")
var car_slot = preload("res://CarSlot.tscn")
var car_slots = []

func _ready():
	add_child(space_filler.instantiate())
	add_child(space_filler.instantiate())
	for car in Menu.owned_cars:
		_create_car_slot(car, true)
	for car in Menu.cars:
		_create_car_slot(car, false)
	add_child(space_filler.instantiate())
	add_child(space_filler.instantiate())

func _process(delta):
	var viewport_center = get_viewport().size / 2
	for car_slot in car_slots:
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

func _create_car_slot(car, isBought):
		var car_slot = car_slot.instantiate()
		car_slot.car_name = car.name
		car_slot.lifes = car.lifes
		car_slot.speed = car.speed
		car_slot.handling = car.handling
		car_slot.price = car.price
		car_slot.txt = car.carTexture
		car_slot.isBought = isBought
		
		var buyButton = car_slot.get_node("BuyButton")
		var selectButton = car_slot.get_node("SelectButton")
		var upgradeButton = car_slot.get_node("UpgradeButton")
		
		selectButton.connect("pressed", Callable(self, "_on_select_button_pressed").bind(car_slot))
		upgradeButton.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind(car_slot))
		
		car_slots.append(car_slot)
		add_child(car_slot)

func _on_SelectButton_pressed(car_slot):
	var car_name = car_slot.car_name
	for car_slot_elmnt in car_slots:
		if car_slot_elmnt.name != car_name:
			car_slot_elmnt.get_node("SelectButton").text = "SELECT"

func _on_upgrade_button_pressed(car_slot):
	var car = Menu._find_car(car_slot.car_name, Menu.owned_cars)
	if car:
		Menu.UpgradeCar = car
	get_tree().change_scene_to_file("res://scenes/upgrade_scene.tscn")

func changeButton(car_slot, is_selected):
	var select_button = car_slot.get_node("SelectButton")
	if select_button:
		if is_selected:
			select_button.text = "SELECTED"
		else:
			select_button.text = "SELECT"
	
