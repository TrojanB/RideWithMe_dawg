extends Sprite2D

var speed:float = 5
var carSprite
var carFrame = 5


var area2D
var animation

var goUp = false
var goDown = false
var index:int

var lanesPositionsY = [  #od gory do dolu
	72, 144, 216, 288, 360, 432
]

func _ready():
	scale.x = 1.9
	scale.y = 1.9
	frame = 0
	area2D = $Area2D
	animation = $AnimationPlayer
	
func _physics_process(delta):
	position += Vector2(-speed,0)
	if goUp: go_up(lanesPositionsY[index])
	elif goDown: go_down(lanesPositionsY[index])

func stop_car():
	speed = 0

func is_car():
	true

func _on_area_2d_area_entered(area):
	print("CAR HITTED")
	var posY = position.y
	index = lanesPositionsY.find(posY,0)
	print(posY)
	print(index)
	if index != null:
		if index == len(lanesPositionsY) - 1:
			true
		elif index == 0:
			true
		else:
			var rn = randi_range(1,2) # 1 - go up, 2 - go down
			if rn==1:
				index+=1
				goUp = true
			elif rn==2:
				index-=1
				goDown = true

func go_up(destinationY):
	if position.y >= destinationY:
		if not animation.current_animation == "go_up":
			animation.play("go_up")
		position+=Vector2(0,-5)
	else: goUp = false
	
func go_down(destinationY):
	if position.y <= destinationY:
		if not animation.current_animation == "go_down":
			animation.play("go_down")
		position+=Vector2(0,1)
	else: goDown = false
	
func destroy_car():
	$".".queue_free()
