extends Node

var current_scene = null
var room_holder = null
var all_rooms_visited = false

func _ready():
	var root = get_tree().get_root()
	room_holder = root.get_node("Main/ViewportContainer/Viewport")
	
func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	
	var root = get_tree().get_root()
	call_deferred("_deferred_goto_scene", path)
	

func change_scene(path):
		
	current_scene = room_holder.get_child(0)
	# It is now safe to remove the current scene
	if current_scene != null:
		current_scene.free()
		
	if all_rooms_visited:
		$RoomCounter.reset()
		all_rooms_visited = false
		path = "res://world/environement/LastScene.tscn"
#		room_holder = get_tree().get_root().get_node("Main/UI/Title")
	else:
#		room_holder = get_tree().get_root().get_node("Main/ViewportContainer/Viewport")
		$RoomCounter.add_room(path)
		
	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instance()

	# Add it to the active scene, as child of root.
	room_holder.add_child(current_scene)
	

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
	
	
func _deferred_goto_scene(path):
	
	var root = get_tree().get_root()
	var ui = root.get_node("Main/UI/Texts")
	for elem in ui.get_children():
		elem.queue_free()

	# The fader calls change_scene after finishing fading the current scene
	root.get_node("Main/UI/SceneFader").fade(path)


func _on_RoomCounter_all_rooms_visited():
	print_debug("ALL ROOMS VISITED")
	all_rooms_visited = true
