extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var enemy = preload ("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 100:
		var e = enemy.instance()
		enemy.connect("")
		add_child(e)
		print(n)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
