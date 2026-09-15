@abstract
class_name UnitSpawner
extends Node2D

## Description: The purpose of this script is to have set locations where units
## spawn and to control the logic behind it.
## Filename: unit_spawner.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

#region export variables (snake_case):
@export var unit_to_spawn : PackedScene
#endregion

#region public variables (non underscore prefixed snake_case):
var unit_uid : String
#endregion

#region private methods (undersocre prefixed snake_case):

func _spawn_unit() -> void:
	if unit_to_spawn == null:
		push_error(name + ": No unit was set to spawn, please set a unit to spawn")
		return
	
	var file_path : String = unit_to_spawn.resource_path
	
	var uid_int : int = ResourceLoader.get_resource_uid(file_path)
	
	var uid_string : String = ResourceUID.id_to_text(uid_int)
	
	unit_uid = uid_string
		
	ManagerSignalBus.load_units.emit([uid_string] as Array[String], self.position)

#endregion
