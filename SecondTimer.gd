extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var secondsleft;

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout", self, "_timeout")
	pass # Replace with function body.

func _timeout():
	secondsleft -= 1
	$SecondsTimer.text = "Time " + str(secondsleft)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
