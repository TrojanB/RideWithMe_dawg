extends ParallaxBackground

@export var speed = 50

func _process(delta):
	scroll_base_offset -= Vector2(speed, 0) * delta
