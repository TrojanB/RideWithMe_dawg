extends Camera2D

@onready var animation_player = $AnimationPlayer

func _on_player_player_has_destroyed_car():
	animation_player.play("shake")
