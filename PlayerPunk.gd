extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 500
var can_start = false
onready var pushbox = $PushBox;
onready var sprite = $PunkSprite;

onready var pushCooldown = $PushCooldown
onready var pushAnimationCooldown = $PushAnimationCooldown
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_can_start():
	can_start = !can_start

func _process(delta):
	
	if pushCooldown.is_stopped():
		if Input.is_action_just_pressed("push"):
			if(can_start):
				get_tree().change_scene("res://pit.tscn")
			sprite.frame = 1
			pushbox.push(rotation)
			pushAnimationCooldown.start()
			pushCooldown.start()
	if pushAnimationCooldown.is_stopped():
		sprite.frame = 0
	

		
		
		
func _physics_process(delta):
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
	move_and_slide(motion*speed)
	look_at(get_global_mouse_position())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
