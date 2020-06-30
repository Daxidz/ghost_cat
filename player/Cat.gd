extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var interactibles  = []

export var speed = 100 

var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if interactibles.size() > 0:
			print(interactibles)
			var interactible = interactibles.front()
			print(interactible)
			if (interactible.has_method("interact")):
				print("I'm interacting with ", interactible)
				interactible.interact(self)
	
	if (velocity.x > 0):
		$Sprite.flip_h = false
	elif (velocity.x < 0):
		$Sprite.flip_h = true
		
		


func _physics_process(delta):
	var input_direction = Vector2.ZERO
	
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = input_direction.normalized() * speed
	
	move_and_slide(velocity)
	


func _on_Area2D_area_entered(area):
	print(area, area.get_groups())
	if (area.is_in_group("interractible")):
		interactibles.push_back(area)
	


func _on_Area2D_area_exited(area):
	if (area.is_in_group("interractible")):
		interactibles.erase(area)
