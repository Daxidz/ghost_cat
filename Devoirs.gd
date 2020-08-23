extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Fiouuuuu! Tous ces devoirs me donnent mal à la tête!\nEn plus c'est de l'Allemand!"


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
	
	speech.rect_position.y = 200
	speech.rect_size.x = 330

	
	#speech.start()
	outline(false, 0)
	$AnimationPlayer.play("devoir")


func _on_Speech_closed():
	can_display = true
