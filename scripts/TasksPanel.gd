extends Control
@onready var tasks = $"."

@onready var v_box_container = $Panel/ScrollContainer/VBoxContainer
@onready var panel = $Panel

func _ready():
	update_tasks()
	
func update_tasks():
	for task_panel in v_box_container.get_children():
		task_panel._update_task()

func _on_visibility_changed():
	if visible: update_tasks()


func _on_go_back_button_pressed():
	visible = false
