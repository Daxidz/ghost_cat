extends "res://world/environement/Interractible.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func interact(body):
	outline(false, 0)
	$Sprite/AnimationPlayer.play("open")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
