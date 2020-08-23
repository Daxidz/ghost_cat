extends "res://world/environement/Interractible.gd"

#onready var speech = get_node("SpeechBubble")

const Speech = preload("res://SpeechBubble.tscn")


export var text = "Mhhhh ça sent bon! Je ne savais pas qu'un régiment était prévu!"


var speech

func stop():
	can_display = true
	$Sprite.frame = 0
	$Particles2D.emitting = false
	$Sprite/AnimationPlayer.stop()
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
	#speech.start()
	outline(false, 0)
	$Sprite/AnimationPlayer.play("open")


func _on_Speech_closed():
	can_display = true
	$Sprite.frame = 0
	$Particles2D.emitting = false
	$Sprite/AnimationPlayer.stop()
