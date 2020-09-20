extends "res://world/environement/Interractible.gd"


func _ready():
	$DirectionalArrow/Sprite/AnimationPlayer.play("idle")
	$DirectionalArrow.visible = false
	
	
	
func _on_Hitbox_body_entered(body):
	._on_Hitbox_body_entered(body)
	if (body.is_in_group("player")):
		$DirectionalArrow.visible = true


func _on_Hitbox_body_exited(body):
	._on_Hitbox_body_exited(body)
	if (body.is_in_group("player")):
		$DirectionalArrow.visible = false
		
func interact(body):
	SceneChanger.goto_scene(connected_room)
