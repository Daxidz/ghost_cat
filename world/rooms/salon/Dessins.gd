extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Hop là! Après un bon dessin on nettoie son pinceau!\nMais?!? Ils ont peint sur les factures!!'"


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
	get_node("/root/Main/UI/Texts").add_child(speech)
	
	speech.rect_position.x = 500
	speech.rect_position.y = 200
	speech.rect_size.x = 330

	
	#speech.start()
	outline(false, 0)
	$AnimationPlayer.play("pinceau")


func _on_Speech_closed():
	can_display = true
