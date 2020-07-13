extends "res://world/environement/Interractible.gd"

#onready var speech = get_node("SpeechBubble")

const Speech = preload("res://world/environement/DialogPopup.tscn")


export var text = "Mhhhh ça sent bon! Je ne savais pas qu'un régiment était prévu!"

var can_display = true

#func _ready():
#	interact(null)
#	pass # Replace with function body.


func interact(body):
	if not can_display:
		return
	can_display = false
	var speech = Speech.instance()
	speech.text = text
	speech.connect("closed", self, "_on_Speech_closed")
	get_node("/root/Main/UI").add_child(speech)
	
	speech.offset = $Position2D.global_position*6
	print(global_position)
	print(speech.offset)
	#speech.start()
	outline(false, 0)
	$Sprite/AnimationPlayer.play("open")

func _on_Speech_closed():
	can_display = true
	$Sprite.frame = 0
	$Particles2D.emitting = false
	$Sprite/AnimationPlayer.stop()
