extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "C'est beau la créativité des enfants!'"

var can_display = true

func interact(body):
	if not can_display:
		return
	can_display = false
	var speech = Speech.instance()
	speech.text = text
	speech.connect("closed", self, "_on_Speech_closed")
	get_node("/root/Main/UI").add_child(speech)

	speech.rect_position = $Position2D.global_position*6
	speech.rect_size.x = 331
	#speech.start()
	outline(false, 0)
	$AnimationPlayer.play("run")


func _on_Speech_closed():
	can_display = true
	$Sprite.frame = 0
	$AnimationPlayer.stop()


