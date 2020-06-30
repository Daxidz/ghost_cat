extends Sprite

onready var tween = get_node("Tween")
#var color1 = Color.red
#var color2 = Color.blue

#var color1 = Color(1,1,1,0.8)
#var color2 = Color(1,1,1,0)

#var color1 = Color.blue
#var color2 = Color.black

var color1 = Color8(5, 239, 251, 220)
var color2 = Color8(5, 239, 251, 20)

var cur_base_color

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")

	cur_base_color = color1
	tween.interpolate_property(material, "shader_param/line_color", color1, color2, 2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	
	var tmp_end_color
	
	if (cur_base_color == color1):
		cur_base_color = color2
		tmp_end_color = color1
	else:
		cur_base_color = color1
		tmp_end_color = color2
		
	
	tween.interpolate_property(material, "shader_param/line_color", cur_base_color, tmp_end_color, 2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
