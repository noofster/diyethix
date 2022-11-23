extends RigidBody2D

export var particle : PackedScene
onready var explosionSound = $ExplosionSound
signal enemy_death
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var collider = get_node("CollisionShape2D");
func _ready():
	print("working")
	contact_monitor = true
	contacts_reported = 1 
	connect("body_entered", self, "_on_bounds_enter")
	pass


func _on_bounds_enter(body):
	if (body.get_name() == "Bounds" && linear_velocity.length() > 750):
		die()

		
			
func die():
	var _particle = particle.instance()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	explosionSound.play()
	collider.disabled = true  
	emit_signal("enemy_death")
	hide()
	get_tree().current_scene.add_child(_particle)
	yield($ExplosionSound, "finished")
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
