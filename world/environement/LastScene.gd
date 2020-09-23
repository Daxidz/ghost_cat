extends Node2D

var increment = 0.0
var accept_input = false

var vp

func _ready():
	get_node("/root/Main/Music").play_theme(3)
	$Sprite.modulate = Color(0, 0, 0, 1)
	$Label.percent_visible = 0
	$Label/Timer.start(1)
	increment = 1.0 / $Label.text.length()
	print(increment)
	
	vp = get_tree().get_root().get_node("Main/ViewportContainer/Viewport")
	
	vp.size = Vector2(1920, 1080)
	
func _exit_tree():
	vp.size = Vector2(240, 135)
	
	
func _input(event):
	if not accept_input:
		return
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_action_pressed("ui_accept") and just_pressed:
		print("KEK")
		$Tween.interpolate_property($Sprite, "modulate", Color(0, 0, 0, 1), Color(1, 1, 1, 1), 3, Tween.TRANS_SINE)
		$Tween.start()
		$Label.visible = false
		accept_input = false


func _on_Timer_timeout():
	if $Label.percent_visible != 1.0:
		$Label/Timer.start(0.05)
		$Label.percent_visible += increment
		print($Label.percent_visible)
	else:
		 accept_input = true
	
