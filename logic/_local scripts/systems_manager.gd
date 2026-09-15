class_name SystemsManager
extends Node

## Description: The purpose of this script is to orcastrate systems for the game.
## Filename: systems_manager.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region private variables (undersocre prefixed snake_case):
var _current_system : Node = null
#endregion

#region export variables (snake_case):
@export var systems_root : Node
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	ManagerSignalBus.load_system.connect(load_system)
#endregion

#region public methods (non underscore prefixed snake_case):
func load_system(system_object : String) -> void:
	_perform_load_system.call_deferred(system_object)
#endregion
	
#region private methods (undersocre prefixed snake_case):
func _perform_load_system(system_object_uid : String) -> void:
	if is_instance_valid(_current_system):
		_current_system.queue_free()
		_current_system = null
		
		# Wait to allow the queued deletion to process so it is out of the scene tree
		await get_tree().process_frame
	
	var new_system_packed : PackedScene = (
			ResourceLoader.load(system_object_uid, "PackedScene") as PackedScene
	)
	
	if new_system_packed == null:
		push_error(name + ": Could not load system as a packed scene " + system_object_uid)
		ManagerSignalBus.return_to_main_menu.emit()
		return
		
	var new_system : Node = new_system_packed.instantiate()
	
	if not new_system:
		push_error(name + ": Could not instantiate new system" + system_object_uid)
		ManagerSignalBus.return_to_main_menu.emit()
		return
		
	if new_system is not Node:
		new_system.free()  # system must be freed to avoid unreferenced orphan nodes
		push_error("Loaded system is not of type Node " + system_object_uid)
		ManagerSignalBus.return_to_main_menu.emit()
		return
	
	_current_system = new_system as Node
	
	if not is_instance_valid(systems_root):
		push_error(name + ": system Root not assigned!")
		ManagerSignalBus.return_to_main_menu.emit()
		return
		
	systems_root.add_child(_current_system)
#endregion
