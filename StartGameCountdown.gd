extends "res://SecondTimer.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var SecondsTimer =  get_parent().get_node("SecondsTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _timeout():
	secondsleft -= 1
	SecondsTimer.text = str(secondsleft)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
