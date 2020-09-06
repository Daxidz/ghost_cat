extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Elle sent bizarre celle-ci...\nHa je vois....\nOn dira que c'est pour l'arthrose d'Eric hehe"

var speech


func stop():
	can_display = true
	speech.stop()
	$AnimationPlayer.stop()
	$Sprite.frame = 0
	
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
	
	speech.rect_position.x = 1000
	speech.rect_position.y = 300
	
	speech.rect_size.x = 400
	

	$AnimationPlayer.play("wind")
	
	#speech.start()
	outline(false, 0)


func _on_Speech_closed():
	can_display = true
