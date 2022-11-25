extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout", self, "_timeout")
	start()
	pass # Replace with function body.

func _timeout():
	get_tree().change_scene("res://MainMenu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
