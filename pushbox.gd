extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pushForce =4000
onready var swingsound = $"../../swing"
onready var hitsound = $"../../hitsound"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func push(r):
	var first = false
	swingsound.play(.1)
	for body in get_overlapping_bodies():
		if(body.name != "PlayerPunk"):
			if !(body is StaticBody2D):
				if(!first):
					first =true
					hitsound.play(.01)
				body.apply_impulse(Vector2(), Vector2(pushForce,0).rotated(r))
