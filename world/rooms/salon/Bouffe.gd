extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Toute cette nouriture me donne faim! J'en vois un qui n'a pas fini son assiette!"


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
	
	speech.rect_position.x = 500
	speech.rect_position.y = 200
	
	speech.rect_size.x = 330
	
	#speech.start()
	outline(false, 0)


func _on_Speech_closed():
	can_display = true
