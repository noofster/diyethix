extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered",self,"_area_entered")
	connect("area_exited",self,"_area_exited")
	pass # Replace with function body.

func _area_entered(area):
	area.get_parent().set_can_start()
	get_parent().frame=0
func _area_exited(area):
	area.get_parent().set_can_start()
	get_parent().frame=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
