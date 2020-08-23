extends Node2D

export var speed = 100
signal player_entered


func _physics_process(delta):
	position.x -= delta * speed
	
	if position.x < 0:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_entered")
