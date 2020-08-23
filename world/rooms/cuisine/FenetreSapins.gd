extends "res://world/environement/Interractible.gd"

const Speech = preload("res://SpeechBubble.tscn")


export var text = "Ou sont donc passés tous les arbres?\nHa ils sont là... Peut-être?"


var speech

func stop():
	can_display = true
	$Sprite.frame = 0
	$AnimationPlayer.stop()
	speech.stop()
	
func interact(body):
	.interact(body)
	if not can_display:
		stop()
		return
	can_display = false
	speech = Speech.instance()
	speech.text = text
	speech.connect("closed", self, "_on_Speech_closed")
	get_node("/root/Main/UI").add_child(speech)

	speech.rect_position = $Position2D.global_position*6
	speech.rect_size.x = 331
	
	outline(false, 0)
	$AnimationPlayer.play("glitch")

