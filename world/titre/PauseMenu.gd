extends Control

var current_button_idx
var nb_buttons

func _ready():
	nb_buttons = $Buttons.get_child_count()
	current_button_idx = 0
	hover_button(current_button_idx)
	$Buttons/RESUME.connect("pressed", self, "_on_Start_pressed")
	$Buttons/QUIT.connect("pressed", self, "_on_Quit_pressed")
	$Buttons/MENU.connect("pressed", self, "_on_Menu_pressed")
#	get_tree().paused = true


func hover_button(btn_idx):
	var btn = $Buttons.get_child(btn_idx)
	btn.grab_focus()
	btn.hovering()


func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		$Buttons.get_child(current_button_idx).exit_hover()
		if current_button_idx == 0:
			current_button_idx = nb_buttons-1
		else:
			current_button_idx = (current_button_idx - 1) % nb_buttons
			
		hover_button(current_button_idx)
	if Input.is_action_just_pressed("ui_right"):
		$Buttons.get_child(current_button_idx).exit_hover()
		current_button_idx = (current_button_idx + 1) % nb_buttons
		hover_button(current_button_idx)
		
		
func _on_Start_pressed():
	get_tree().root.get_node("Main").remove_pause_menu()
	
func _on_Quit_pressed():
	get_tree().quit()
	
func _on_Menu_pressed():
	get_tree().root.get_node("Main").remove_pause_menu()
	get_tree().root.get_node("Main").show_title_screen()
