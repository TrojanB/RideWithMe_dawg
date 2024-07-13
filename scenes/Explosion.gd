extends Node2D

func _on_explosion_player_animation_finished(anim_name):
	var parent = get_parent()
	parent.queue_free()
