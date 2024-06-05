extends AudioStreamPlayer2D

var soundtracks = [
	"res://music/a-hero-of-the-80s-126684.mp3",
	"res://music/back-to-the-80s-163722.mp3",
	"res://music/lady-of-the-80x27s-128379.mp3",
	"res://music/electric-dreams-167873.mp3"
]

func _ready():
	stream = load(soundtracks[1])
