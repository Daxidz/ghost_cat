extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


var text = "BANG!!!\nSaleté de cloche! On ne pense pas aux chats qui sont trop petits pour se prendre le store!\n\n(Je me demande ce que ça fait si on se la prend 3 fois...)"


var speech

var nb_activated = 0

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
	
	get_node("/root/Main/AudioStreamPlayer").stream = load("res://assets/sounds/fx/cowbell-percussion-2.wav")
	get_node("/root/Main/AudioStreamPlayer").play()
	
	nb_activated += 1
	if (nb_activated == 3) :
		nb_activated = 0
		SceneChanger.goto_scene(connected_room)
	
	#speech.start()
	outline(false, 0)


func _on_Speech_closed():
	can_display = true
