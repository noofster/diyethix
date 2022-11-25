extends Node2D

var speed = 5  # rotation speed (in radians)
var radius = 120  # desired orbit radius
var d = 0.0
func _ready():
	$Sprite.position = Vector2(radius, 0) # desired orbit radius
	pass

func _process(delta):
	d +=delta
	position = Vector2(sin(d*speed)*radius,cos(d*speed)*radius)+Vector2(400,400)
