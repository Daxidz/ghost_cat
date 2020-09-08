extends "res://world/environement/Interractible.gd"

const Speech = preload("res://SpeechBubble.tscn")


export var text = "Après la petite coupe Danemark, bien tabasser le congel' pour s'assurer qu'il soit fermé!"

var speech
var player

func _ready():
	$Sprite.frame = 0

func stop():
	can_display = true
	$AnimationPlayer.stop()
	$Sprite.frame = 0
	player.visible = true
	speech.stop()
	
func interact(body):
	.interact(body)
	if not can_display:
		stop()
		return
		
	player = body
	player.visible = false
	can_display = false
	speech = Speech.instance()
	speech.text = text
	speech.connect("closed", self, "_on_Speech_closed")
	get_node("/root/Main/UI/Texts").add_child(speech)

	speech.rect_position = $Position2D.global_position*6
	speech.rect_size.x = 331
	#speech.start()
	outline(false, 0)
	$AnimationPlayer.play("tabasse")


