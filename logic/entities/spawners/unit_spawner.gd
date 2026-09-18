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
	unit_uid = CommonUtils.get_uid_from_scene(unit_to_spawn)
	
	if unit_uid != "":
		ManagerSignalBus.load_units.emit([unit_uid] as Array[String], self.position)

#endregion
