extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	for body in get_overlapping_bodies():
		if(body.name == "PlayerPunk"):
			body.inButton = true;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
