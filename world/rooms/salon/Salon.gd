extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cat/Camera2D.current = true



func _on_Salon_tree_exited():
	print("topreoijerf")
	$Cat/Camera2D.current = false
