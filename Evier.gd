extends "res://world/environement/Interractible.gd"

var is_opened = false
func interact(body):
	if is_opened:
		$AnimationPlayer.play_backwards("open")
	else:
		$AnimationPlayer.play("open")
	is_opened = not is_opened
