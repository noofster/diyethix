extends Node2D

var speed = 2  # rotation speed (in radians)
var radius = 500  # desired orbit radius
var d = 0.0
func _ready():
	$Sprite.position = Vector2(radius, 0) # desired orbit radius
	pass

func _process(delta):
	d +=delta
	position = Vector2(sin(d*speed)*radius*1.2,cos(d*speed)*radius/1.2)+Vector2(0,350)
