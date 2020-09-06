tool
extends ColorRect

signal done

onready var _anim_player = $AnimationPlayer

var _path

func fade(path):
	_path = path
	_anim_player.play("fade")
	

func change_scene():
	SceneChanger.change_scene(_path)
