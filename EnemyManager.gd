extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var enemy = preload ("res://enemy.tscn")
signal enemy_death
var circle_mob_leader = preload("res://CircleEnemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var leader = circle_mob_leader.instance()
	add_child(leader)
	#leader.position = Vector2(500,500)

	for n in 150:
		var x = rand_range(250, 800)
		var y = rand_range(250, 540)
		if(x >= 495 && x <= 505 && y>=270 && y<=296):
			x = 250
			y = 350
		var e = enemy.instance()
		
		e.global_position = Vector2(x,y)
		if(n%4==0):
			e.gravity_scale = -1
		elif (n%3==0):
			e.gravity_scale =1
		else:
			e.leader = leader.get_node("Sprite")
		#e.position =  (Vector2(512,200))
		e.connect("enemy_death", self, "_enemy_death")
		add_child(e)

	pass # Replace with function body.

func _enemy_death(point):
	emit_signal("enemy_death",point)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
