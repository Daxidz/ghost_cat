extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Je pourrais aller ici, mais je sais écrire un mail tout seul!"


var speech

func stop():
	can_display = true
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
	get_node("/root/Main/UI/Texts").add_child(speech)

	speech.rect_position = $Position2D.global_position*6
	speech.rect_size.x = 331
	#speech.start()
	outline(false, 0)


func _on_Speech_closed():
	can_display = true


