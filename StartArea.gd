extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var _return = connect("body_entered",self,"_body_entered")
	var _return2 = connect("body_exited",self,"_body_exited")
	pass # Replace with function body.

func _body_entered(body):
	if(body.name == "PlayerPunk"):
		body.set_can_start()
		get_parent().frame=0
func _body_exited(body):
	if(body.name == "PlayerPunk"):
		body.set_can_start()
		get_parent().frame=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
