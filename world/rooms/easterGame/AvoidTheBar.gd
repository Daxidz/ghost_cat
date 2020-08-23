extends Node2D

const BASE_BG_SPEED = 0.06
const BASE_ENEMY_SPEED = 200


var cur_bg_speed
var player_alive = true

func _ready():
	start()
	
	
func _process(delta):
	if not player_alive and Input.is_action_just_pressed("ui_accept"):
		start()
	
func start():
	cur_bg_speed = BASE_BG_SPEED
	$EnemYSpawner.speed = BASE_ENEMY_SPEED
	$EnemYSpawner.start()
	$BG.material.set_shader_param("speed_scale", BASE_BG_SPEED)
	$SpeedTimer.start()
	$CatEaster.modulate = Color(1,1,1,1)
	
	player_alive = true
	
func add_bar(bar):
	bar.connect("player_entered", self, "onPlayerKilled")
	add_child(bar)
	
func onPlayerKilled():
	print("YOU LOST")
	$EnemYSpawner.stop()
	$BG.material.set_shader_param("speed_scale", 0.00)
	$SpeedTimer.stop()
	player_alive = false
	
	$CatEaster.modulate = Color(0.63,0,0,1)


func _on_SpeedTimer_timeout():
	$EnemYSpawner.speed += 10
	cur_bg_speed += 0.001
#	$BG.material.set_shader_param("speed_scale", cur_bg_speed)
