extends Light2D

var rng = RandomNumberGenerator.new()

onready var tween = get_node("Tween")

const HIGH_ENERGY = 0.5
const LOW_ENERGY = 0.3
const TWEEN_MAX_TIME = 4.0
const TWEEN_MIN_TIME = 2.0

var cur_energy


func _ready():
 rng.randomize()
 var parent = get_parent()
 
 cur_energy = LOW_ENERGY
 
 tween.interpolate_property(self, "energy", 1.0, 0.5, TWEEN_MAX_TIME, Tween.TRANS_QUINT)
 tween.start()


func _on_Tween_tween_completed(object, key):
 
 var dst_energy
 var parent = get_parent()
 
 if cur_energy == HIGH_ENERGY:
  dst_energy = LOW_ENERGY
 else:
  dst_energy = HIGH_ENERGY
  
 var time = rng.randf_range(TWEEN_MIN_TIME, TWEEN_MAX_TIME)
  
 tween.stop_all()
 tween.interpolate_property(self, "energy", cur_energy, dst_energy, time, Tween.TRANS_QUINT)
 tween.start()
 cur_energy = dst_energy
