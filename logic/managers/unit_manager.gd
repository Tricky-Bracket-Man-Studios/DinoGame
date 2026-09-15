class_name UnitManager
extends Node

## Description: The purpose of this script is to orcastrate units for the game.
## Filename: unit_manager.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

#region export variables (snake_case):
@export var unit_root : Node2D
#endregion

#region private variables (undersocre prefixed snake_case):
var _current_units_dictionary : Dictionary = {}
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	ManagerSignalBus.load_units.connect(load_units)
#endregion

#region public methods (non underscore prefixed snake_case):
func load_units(unit_objects : Array[String], units_spawn_position) -> void:
	_perform_load_unit.call_deferred(unit_objects, units_spawn_position)

func unload_units() -> void:
	if is_instance_valid(_current_units_dictionary):
		for unit in _current_units_dictionary:
			unit.queue_free()
		_current_units_dictionary.clear()
		
		# Wait to allow the queued deletion to process so it is out of the scene tree
		await get_tree().process_frame
#endregion
	
#region private methods (undersocre prefixed snake_case):
func _perform_load_unit(unit_object_uids_array : Array[String], units_spawn_position) -> void:
	for unit_object_uid in unit_object_uids_array:
		var new_unit_packed : PackedScene = (
				ResourceLoader.load(unit_object_uid, "PackedScene") as PackedScene
		)
	
		if new_unit_packed == null:
			push_error(name + ": Could not load unit as a packed scene " + unit_object_uid)
			return
		
		var new_unit : Node2D = new_unit_packed.instantiate()
	
		if not new_unit:
			push_error(name + ": Could not instantiate new unit" + unit_object_uid)
			return
		
		if new_unit is not Node2D:
			new_unit.free()  # Unit must be freed to avoid unreferenced orphan nodes
			push_error("Loaded Unit is not of type Node2D " + unit_object_uid)
			return
		
		new_unit.position = units_spawn_position
		
		_current_units_dictionary[unit_object_uid] = new_unit as Node2D
	
		if not is_instance_valid(unit_root):
			push_error(name + ": Unit Root not assigned!")
			return
		
		unit_root.add_child(_current_units_dictionary[unit_object_uid])
#endregion
