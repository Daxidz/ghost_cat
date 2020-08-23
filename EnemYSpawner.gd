extends Node




const Ennemy = preload("res://world/rooms/easterGame/EnemmyBar.tscn") 

export var freq = 1 
export var emmiting = false
var speed = 200

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
func start():
	emmiting = true
	$Timer.start(1/freq)
	
	
func stop():
	$Timer.stop()
	emmiting = false


func _on_Timer_timeout():
	print("NEW ENEMY")
	if emmiting:
		var ennemy = Ennemy.instance()
		
		ennemy.position.x = 240
		ennemy.position.y = rng.randi_range(0, 135)
		ennemy.speed = speed
		
		get_parent().add_bar(ennemy)
		
		$Timer.start(1/freq)
