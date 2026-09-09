class_name UnitSpawner
extends Node2D

## Description: The purpose of this script is to have set locations where units
## spawn and to control the logic behind it.
## Filename: unit_spawner.gd
## Author(s): Matthew Perry,
## Last Updated: 09/09/2026

#region export variables (snake_case):
@export var unit_to_spawn : PackedScene
#endregion

#region private variables (undersocre prefixed snake_case):
var _unit_spawner : UnitSpawner = self
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	print(self.name + ": initializing unit!")
	var spawned_unit = unit_to_spawn.instantiate()
	
	_unit_spawner.add_child(spawned_unit)
	print(self.name + ": " + spawned_unit.name + " spawned!")
#endregion
