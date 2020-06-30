extends "res://world/environement/Interractible.gd"


onready var tween = get_node("Sprite/Tween")

const OPAQUE_ALPHA = 0.4

func _ready():
	$Sprite.modulate.a = 0.0



func _on_Hitbox_body_entered(body):
	if body.is_in_group("player"):
		tween.interpolate_property($Sprite, "modulate", $Sprite.modulate, Color(1,1,1,OPAQUE_ALPHA), 1)
		tween.start()


func _on_Hitbox_body_exited(body):
	if body.is_in_group("player"):
		tween.interpolate_property($Sprite, "modulate", $Sprite.modulate, Color(1,1,1,0), 1.5)
		tween.start()
