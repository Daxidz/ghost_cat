extends MarginContainer

signal closed()



onready var label = get_node("MarginContainer/Label")
onready var timer = get_node("Timer")
onready var ninerect = get_node("NinePatchRect")

var step = 0.0
var nb_visible = 0
var text_lenght = 0

export var text_speed = 0.0

export var text = ""

func _ready():
	start()
	label.percent_visible = 1

#func _input(event):
#	if event.is_action_pressed("ui_accept"):
#		timer.stop()
#		emit_signal("closed")
#		queue_free()


func _on_Timer_timeout():
	
	if nb_visible < text_lenght:
		label.text += text[nb_visible]
		#label.percent_visible += step
		timer.start(text_speed)
#	else:
#		queue_free()
#		return

	nb_visible += 1
	
func start():
	print(text)
	visible = true
	timer.start(text_speed)
	
	text_lenght = text.length()
	
	if text_lenght == 0:
		return
	
	step = 1.0 / text_lenght
	
func stop():
	label.text = ""	
	visible = false
	queue_free()
