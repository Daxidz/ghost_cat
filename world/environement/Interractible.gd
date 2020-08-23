extends Node2D

export var connected_room: String

signal door_entered()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var outline_col = Color(1, 1, 1)

var cur_color


func set_signals():
	self.connect("body_entered", self, "_on_Hitbox_body_entered")
	self.connect("body_exited", self, "_on_Hitbox_body_exited")
	self.connect("mouse_entered", self, "_on_Hitbox_mouse_entered")
	self.connect("mouse_exited", self, "_on_Hitbox_mouse_exited")

func outline(is_outlined, fading_time=1):
	
		
	$Sprite/Tween.stop_all()
	var col1 = outline_col
	var col2 = outline_col
	
	
	if is_outlined:
		col1 = outline_col
		col1.a = 0
		col2 = outline_col
	else:
		col1 = outline_col
		col2 = outline_col
		col2.a = 0
	
	# Treat the case if we are in off to not get on again
	if col2 == cur_color:
		return
	cur_color = col2
	
	# Instant disable
	if fading_time == 0:
		$Sprite.material.set_shader_param("line_color", col2)
		return
	
		
	$Sprite/Tween.interpolate_property($Sprite.material, "shader_param/line_color", col1, col2, fading_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Sprite/Tween.start()

func _ready():
	set_signals()
	outline(false, 0)

func _on_CollisionShape2D_body_entered(body):
	if (body.is_in_group("player")):
		outline(true, 0.5)

func _on_Hitbox_body_entered(body):
	if (body.is_in_group("player")):
		print("kek")
		outline(true, 0.5)


func _on_Hitbox_body_exited(body):
	if (body.is_in_group("player")):
		outline(false, 0.5)

func _on_Hitbox_mouse_entered():
	outline(true, 0.5)
	interact(null)


func _on_Hitbox_mouse_exited():
	outline(false, 0.5)
	
	
var can_display = true

func interact(player):
	if not can_display:
		player.can_move = true
		return
	player.can_move = false
	
#func _process(delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		var col = get_ov
#	pass

func stop():
	can_display = true
