extends RigidBody2D

export var particle : PackedScene
export var point : PackedScene
var leader;
var timer;
var dead = false;
onready var explosionSound = $ExplosionSound
signal enemy_death
signal endofscene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var collider = get_node("CollisionShape2D");
func _ready():
	contact_monitor = true
	contacts_reported = 1 
	connect("body_entered", self, "_on_bounds_enter")
	pass


func _on_bounds_enter(body):
	if (body.get_name() == "Bounds" && linear_velocity.length() > 750):
		die(false)
func _physics_process(delta):
	if(leader != null):
		look_at(leader.get_global_position())
		linear_velocity += Vector2(8,0).rotated(rotation)


var exploding =false;
func explode():
	#collider.queue_free()
	if(exploding):
		return
	exploding = true
	var _particle = particle.instance()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	explosionSound.play()
	hide()
	get_tree().current_scene.add_child(_particle)
	yield($ExplosionSound, "finished")
	queue_free()
	exploding = false
	
func free_from_scene():
	die(true)
func die(endofscene):
	if(endofscene):
		emit_signal("endofscene")
	if(dead):
		return;
	dead = true
	var _particle = particle.instance()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	if(!endofscene):
		explosionSound.play()
		var p = point.instance()
		get_tree().current_scene.add_child(p)
		p.global_position = global_position
		emit_signal("enemy_death",p)
	hide()
	get_tree().current_scene.add_child(_particle)
		#yield($ExplosionSound, "finished")
	global_position = Vector2(-1100,-1100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
