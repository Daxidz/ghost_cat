extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Il est l'heure de se refaire un petit classique: Le Choeur de l'école de Vallorbe!\nOn entend même la ptite Myriam qui chante!"


var speech

func stop():
	can_display = true
	speech.stop()
	$AnimationPlayer.stop()
	$AudioStreamPlayer2D.stop()
	
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
	speech.rect_position.y = $Position2D.global_position.y*6
	speech.rect_size.x = 330
	
	get_node("/root/Main/AudioStreamPlayer").stream = load("res://assets/sounds/fx/mama_chant.wav")
	get_node("/root/Main/AudioStreamPlayer").play()
	
	#speech.start()
	outline(false, 0)
	$AnimationPlayer.play("musica")


func _on_Speech_closed():
	can_display = true
