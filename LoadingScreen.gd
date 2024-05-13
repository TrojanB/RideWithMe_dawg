extends Sprite2D

@onready var animationPlayer = $AnimationPlayer
@onready var animation = "Pixel"

func _on_level_ready():
	var image = get_viewport().get_texture().get_image()
	var tx = ImageTexture.create_from_image(image)
	texture = tx
	animationPlayer.play("FadeIn")
