extends RigidBody2D

export var impulse = 200

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		apply_impulse(Vector2(0,0), Vector2(0,-impulse))
