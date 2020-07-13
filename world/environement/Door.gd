extends "res://world/environement/Interractible.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func interact(player):
	print(player, " is interracting with me (", self, ")")
	SceneChanger.goto_scene(connected_room)
