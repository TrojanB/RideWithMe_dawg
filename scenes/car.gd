extends Sprite2D

var speed:float = 5
var carSprite
var carFrame = 5

var area2D
var animation

var goUp = false
var goDown = false
var index:int
var destinationY:int = 0

var lanesPositionsY = [  #od gory do dolu
	72, 144, 216, 288, 360, 432
]
var changeLaneInterval = 72

var player
var destroyCarVector

func _ready():
	scale.x = 1.9
	scale.y = 1.9
	frame = 0
	area2D = $Area2D
	animation = $AnimationPlayer
	player = $"./Player"

func _physics_process(delta):
	position += Vector2(-speed,0)
	if goUp: go_up(destinationY)
	elif goDown: go_down(destinationY)

func stop_car():
	speed = 0

func is_car():
	true

func _on_area_2d_area_entered(area):
	var posY = global_position.y
	if global_position.x > area.global_position.x:
		if global_position.y < 300: #w przypadku gdy samochod dotyka gornej granicy
			destinationY = posY+changeLaneInterval
			animation.play("go_down")
			goDown = true
		elif global_position.y > 600:#w przypadku gdy samochod dotyka dolnej granicy
			destinationY = posY-changeLaneInterval
			animation.play("go_up")
			goUp = true
		else:
			var rn = randi_range(1,2) # 1 - go up, 2 - go down
			if rn==1:
				destinationY = posY-changeLaneInterval
				animation.play("go_up")
				goUp = true
			elif rn==2:
				destinationY = posY+changeLaneInterval
				animation.play("go_down")
				goDown = true

func go_up(destinationY):
	if global_position.y > destinationY:
		position+=Vector2(0,-5)
	else:
		goUp = false
		goDown = false 
		animation.play("RESET")
	
func go_down(destinationY):
	if global_position.y < destinationY:
		position+=Vector2(0,5)
	else: 
		goUp = false
		goDown = false 
		animation.play("RESET")

func destroy_car():
	$".".queue_free()
