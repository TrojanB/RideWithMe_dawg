extends Panel

@onready var collect_award_button = $CollectAwardButton
@onready var task_label = $TaskLabel
@onready var progress_label = $ProgressLabel


@export_multiline var task_content
var completed = false
var task_value : int
var player_value : int

func _ready():
	_update_task()

func _update_task():
	task_label.text = task_content + str(task_value)
	progress_label.text = str(player_value) + "/" + str(task_value)
	
	if completed: collect_award_button.visible = true
	else: collect_award_button.visible = false
