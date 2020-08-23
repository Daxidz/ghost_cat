extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Puissance 4, Uno, Jenga... Nous disposons de vos tous jeux rêvés et plus encore!"


var speech

func stop():
	can_display = true
	speech.stop()
	$AnimationPlayer.stop()
	
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
	
	speech.rect_position.x = 600
	speech.rect_position.x = 600
	speech.rect_position.y = 200
	
	speech.rect_size.x = 330

	
	#speech.start()
	outline(false, 0)
	$AnimationPlayer.play("jeux")


func _on_Speech_closed():
	can_display = true
