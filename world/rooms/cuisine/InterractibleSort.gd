extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		child.z_index = -1
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
