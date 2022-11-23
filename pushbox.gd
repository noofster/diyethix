extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pushForce =3000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func push(r):
	for body in get_overlapping_bodies():
		if(body.name != "PlayerPunk"):
			if !(body is StaticBody2D):
				body.apply_impulse(Vector2(), Vector2(pushForce,0).rotated(r))
