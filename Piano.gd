extends "res://world/environement/Interractible.gd"
const Speech = preload("res://SpeechBubble.tscn")


export var text = "Même désacordé, c'est un plaisir de jouer du piano!!"


var player = null
var speech = null

func _ready():
	$Sprite.frame = 0
	
#func _process(delta):
#	if Input.is_action_pressed("ui_accept"):
#		speech.cl

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
	get_node("/root/Main/UI").add_child(speech)

	speech.rect_position = $Position2D.global_position*6
	speech.rect_size.x = 331
	#speech.start()
	outline(false, 0)
	$AnimationPlayer.play("play")


func stop():
	can_display = true
	$AnimationPlayer.stop()
	$Sprite.frame = 0
	player.visible = true
	speech.stop()

func _on_Speech_closed():
	can_display = true
	$AnimationPlayer.stop()
	$Sprite.frame = 0
	
	player.visible = true

