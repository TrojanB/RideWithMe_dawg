extends ParallaxBackground

@export var speed : int = 100

func _process(delta):
	scroll_base_offset -= Vector2(speed, 0)
