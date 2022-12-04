extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 500
var can_start = false
onready var pushbox = $PushBox;
onready var sprite = $PunkSprite;
onready var introsound = $"../Intro"
onready var transitionsound = $"../Transition"
onready var pushCooldown = $PushCooldown
onready var pushAnimationCooldown = $PushAnimationCooldown
onready var collider = $Area2D
var colliding_stopping_enemies = Array();
var enabled = true
# Called when the node enters the scene tree for the first time.
func _ready():
	collider.connect("body_entered", self, "_on_bounds_enter")
	collider.connect("body_exited", self, "_on_bounds_exit")
	pass # Replace with function body.

func set_can_start():
	can_start = !can_start

func _process(_delta):
	if pushCooldown.is_stopped():
		if Input.is_action_just_pressed("push") && enabled:
			if(can_start):
				var timer_parent = get_parent().get_node("TimerNode2D")
				timer_parent.get_child(1).visible = true
				timer_parent.get_child(0).start()
				introsound.stop()
				transitionsound.play()
				enabled = false
				yield(transitionsound, "finished")
				var _return = get_tree().change_scene("res://pit.tscn")
			sprite.frame = 1
			pushbox.push(rotation)
			pushAnimationCooldown.start()
			pushCooldown.start()
	if pushAnimationCooldown.is_stopped():
		sprite.frame = 0
func _on_bounds_enter(body):
	if("Stopper" in body.name):
		print(colliding_stopping_enemies.size())
		colliding_stopping_enemies.append(1)
func _on_bounds_exit(body):
	print(colliding_stopping_enemies.size())
	if("Stopper" in body.name):
		colliding_stopping_enemies.pop_back()
func _physics_process(_delta):
	if(!enabled):
		return
	var motion = Vector2()
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	motion = motion.normalized()
	var _return = move_and_slide(motion*speed/(colliding_stopping_enemies.size()+1))
	look_at(get_global_mouse_position())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
