extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var timer = $"../GameTimer"

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout",self,"play_intro")
	$GameMusic.play()
	pass # Replace with function body.

func play_intro():
	$GameMusic.stop()
	$"../Intro".play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
