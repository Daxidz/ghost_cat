extends Node2D


const title_screen = preload("res://world/titre/TitleScreen.tscn")
const pause_screen = preload("res://world/titre/PauseMenu.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var menu_showed = false

func show_pause_menu():
	var pause = pause_screen.instance()
	$UI/Pause.add_child(pause)
	get_tree().paused = true
	
func remove_pause_menu():
	for elem in $UI/Pause.get_children():
		elem.queue_free()
	get_tree().paused = false
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if not menu_showed:
			show_pause_menu()
		else:
			$UI/Pause.get_child(0).queue_free()
			get_tree().paused = false

func show_title_screen():
	for elem in $ViewportContainer/Viewport.get_children():
		elem.queue_free()
	
	
	var title = title_screen.instance()
	$UI.add_child(title)

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
