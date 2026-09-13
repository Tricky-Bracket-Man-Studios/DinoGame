class_name LevelManager
extends Node

## Description: The purpose of this script is to orcastrate levels for the game.
## Filename: level_manager.gd
## Author(s): Matthew Perry,
## Last Updated: 09/12/2026

#region export variables (snake_case):
@export var level_root : Node2D
#endregion

#region private variables (undersocre prefixed snake_case):
var _current_level : Node2D = null
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	ManagerSignalBus.load_level.connect(load_level)
#endregion

#region public methods (non underscore prefixed snake_case):
func load_level(level_object : String) -> void:
	_perform_load_level.call_deferred(level_object)
#endregion
	
#region private methods (undersocre prefixed snake_case):
func _perform_load_level(level_object_uid : String) -> void:
	if is_instance_valid(_current_level):
		_current_level.queue_free()
		_current_level = null
		
		# Wait to allow the queued deletion to process so it is out of the scene tree
		await get_tree().process_frame
	
	var new_level_packed : PackedScene = (
			ResourceLoader.load(level_object_uid, "PackedScene") as PackedScene
	)
	
	if new_level_packed == null:
		push_error(name + ": Could not load level as a packed scene " + level_object_uid)
		ManagerSignalBus.return_to_main_menu.emit()
		return
		
	var new_level : Node = new_level_packed.instantiate()
	
	if not new_level:
		push_error(name + ": Could not instantiate new level" + level_object_uid)
		ManagerSignalBus.return_to_main_menu.emit()
		return
		
	if new_level is not Node2D:
		new_level.free()  # Level must be freed to avoid unreferenced orphan nodes
		push_error("Loaded Level is not of type Node2D " + level_object_uid)
		ManagerSignalBus.return_to_main_menu.emit()
		return
	
	_current_level = new_level as Node2D
	
	if not is_instance_valid(level_root):
		push_error(name + ": Level Root not assigned!")
		ManagerSignalBus.return_to_main_menu.emit()
		return
		
	level_root.add_child(_current_level)
#endregion
