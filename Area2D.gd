extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	for body in get_overlapping_bodies():
		print(body.name)
		if(body.name != "PlayerPunk"):
			body.add_central_force(Vector2(-1,0))
