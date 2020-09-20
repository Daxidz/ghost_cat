extends Node

signal all_rooms_visited

var added_rooms = []
const NB_ROOMS = 2

func add_room(path):
	if added_rooms.find(path) == -1:
		added_rooms.append(path)
	
	if added_rooms.size() == NB_ROOMS:
		emit_signal("all_rooms_visited")
	
func reset():
	added_rooms.clear()

func _ready():
	pass
