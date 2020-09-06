extends Node2D

const BASE_BG_SPEED = 0.06
const BASE_ENEMY_SPEED = 200


var cur_bg_speed
var player_alive = true
var score = 0

func _ready():
	start()
	

	
func _process(delta):
	if not player_alive and Input.is_action_just_pressed("ui_accept"):
		SceneChanger.goto_scene("res://world/Terasse.tscn")
	
func start():
	cur_bg_speed = BASE_BG_SPEED
	$EnemYSpawner.speed = BASE_ENEMY_SPEED
	$EnemYSpawner.start()
	$BG.material.set_shader_param("speed_scale", BASE_BG_SPEED)
	$SpeedTimer.start()
	$CatEaster.modulate = Color(1,1,1,1)
	
	player_alive = true
	score = 0
	$Score.text = str(score)
	
func add_bar(bar):
	bar.connect("player_entered", self, "onPlayerKilled")
	bar.connect("tree_exited", self, "increment_score")
	add_child(bar)
	
func onPlayerKilled():
	print("YOU LOST")
	$EnemYSpawner.stop()
	$BG.material.set_shader_param("speed_scale", 0.00)
	$SpeedTimer.stop()
	player_alive = false
	
	$CatEaster.modulate = Color(0.63,0,0,1)

func increment_score():
	if !player_alive:
		return
	score += 1
	$Score.text = str(score)
	
	
func _on_SpeedTimer_timeout():
	$EnemYSpawner.speed += 10
	cur_bg_speed += 0.001
#	$BG.material.set_shader_param("speed_scale", cur_bg_speed)
