extends Node2D

# Declare member variables here. Examples:
# var a = 2

func set_camera_limit():
	var limits = $BG.texture.get_size()
#	$Cat/Camera2D.limit_left = -limits.x / 2
#	$Cat/Camera2D.limit_right = limits.x / 2
#	$Cat/Camera2D.limit_top = -limits.y / 2
#	$Cat/Camera2D.limit_bottom = limits.y / 2
	
	$Camera2D.limit_left = -limits.x / 2
	$Camera2D.limit_right = limits.x / 2
	$Camera2D.limit_top = -limits.y / 2
	$Camera2D.limit_bottom = limits.y / 2
	

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_camera_limit()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
