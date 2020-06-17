extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var outline_col = Color(1, 1, 1)

func outline(is_outlined, fading_time=1):
	
		
	$Sprite/Tween.stop_all()
	var col1 = outline_col
	var col2 = outline_col
	
	
	if is_outlined:
		col1 = Color(1, 1, 1, 0)
		col2 = Color(1, 1, 1, 1)
	else:
		col2 = Color(1, 1, 1, 0)
		col1 = Color(1, 1, 1, 1)
		
	if fading_time == 0:
		#$Sprite.material.set_shader_param("line_color", col2)
		return
		
	$Sprite/Tween.interpolate_property($Sprite.material, "shader_param/line_color", col1, col2, fading_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Sprite/Tween.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite
	outline(false, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CollisionShape2D_body_entered(body):
	if (body.is_in_group("player")):
		outline(true, 0.5)


func _on_Hitbox_body_exited(body):
	if (body.is_in_group("player")):
		outline(false, 0.5)

func _on_Hitbox_mouse_entered():
	outline(true, 0.5)


func _on_Hitbox_mouse_exited():
	outline(false, 0.5)
	
func interact(player):
	print(player, " is interracting with me (", self, ")")
	pass
