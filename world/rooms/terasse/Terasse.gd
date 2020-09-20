extends Node2D



func _ready():
	get_node("/root/Main/Music").play_theme(2)
