extends Light2D

export var max_brightness = 0.6
export var min_brightness = 0.5
export var TWEEN_TIME = 3

var cur_brightness = min_brightness

func _ready():
	$Tween.interpolate_property(self, "texture_scale", min_brightness, max_brightness, Tween.TRANS_LINEAR)
	$Tween.start()
	cur_brightness = min_brightness

func _on_Tween_tween_all_completed():
	var dst_brightness
	
	if cur_brightness == max_brightness:
		dst_brightness = min_brightness
	else:
		dst_brightness = max_brightness
	
	$Tween.stop_all()
	$Tween.interpolate_property(self, "texture_scale", cur_brightness, dst_brightness, TWEEN_TIME, Tween.TRANS_SINE)
	$Tween.start()
	cur_brightness = dst_brightness
