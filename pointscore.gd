extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var dir = Vector2(rand_range(-2,1),-1.0)
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Grow")
	pass # Replace with function body.

func _process(delta):
	if global_position.x<50:
		dir = Vector2(1,0)
	if global_position.x>800:
		dir = Vector2(-1,0)
	global_position += dir*150*delta
	if(int($Label.text) >= 1000):
		$Label.add_color_override("font_color", Color(rand_range(.5,1),rand_range(0,1),rand_range(.5,1),1))
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
