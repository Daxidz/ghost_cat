extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Un ptit bain de minuit dans la seille...\nMais que demande le peuple!"

var speech


func stop():
	can_display = true
	speech.stop()
	$AnimationPlayer.stop()
	$Sprite.frame = 0
	
func interact(body):
	.interact(body)
	if not can_display:
		body.visible = true
		stop()
		return
	can_display = false
	speech = Speech.instance()
	speech.text = text
	speech.connect("closed", self, "_on_Speech_closed")
	get_node("/root/Main/UI/Texts").add_child(speech)
	
	speech.rect_position.x = 300
	speech.rect_position.y = 300
	
	speech.rect_size.x = 330
	
	body.visible = false

	$AnimationPlayer.play("baignade")
	
	#speech.start()
	outline(false, 0)


func _on_Speech_closed():
	can_display = true
