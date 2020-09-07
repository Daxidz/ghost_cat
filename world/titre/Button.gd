tool
extends Button




func exit_hover():
	$AnimationPlayer.stop()
	
func hovering():
	print_debug("Hovering on {}", self)
	$AnimationPlayer.play("selected")

func _on_Button_mouse_entered():
	hovering()

func _on_Button_mouse_exited():
	exit_hover()


