extends "res://world/environement/Interractible.gd"

const Speech = preload("res://SpeechBubble.tscn")


export var text = "Je sens déjà l'odeur des cervelas et le son de Dédée qui chante!"

func _ready():
	$AnimationPlayer.play("fire")

var speech

func stop():
	can_display = true
	$Sprite.frame = 0
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
	$AnimationPlayer.play("open")


