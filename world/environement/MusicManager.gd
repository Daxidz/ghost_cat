extends AudioStreamPlayer

const MUSIC_PATH = "res://assets/sounds/musics/"

const VOLUME_BASE = -13.0

var cur_theme = 0

var faded_out = false

func _ready():
	pass
	
func play_theme(theme: int):
	
	if cur_theme != theme:
		stream = load(MUSIC_PATH + "main" + str(theme) + ".ogg")
		cur_theme = theme
		$Tween.interpolate_property(self, "volume_db", VOLUME_BASE, -80.0, 1, Tween.TRANS_LINEAR)
		$Tween.start()
		faded_out = true


func _on_Tween_tween_all_completed():
	if faded_out:
		play()
		$Tween.interpolate_property(self, "volume_db", -40.0, VOLUME_BASE, 2, Tween.TRANS_LINEAR)
		$Tween.start()
		faded_out = false

