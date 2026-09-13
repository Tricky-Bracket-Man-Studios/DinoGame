class_name UnitSpawner
extends Node2D

## Description: The purpose of this script is to have set locations where units
## spawn and to control the logic behind it.
## Filename: unit_spawner.gd
## Author(s): Matthew Perry,
## Last Updated: 09/11/2026

#region export variables (snake_case):
@export var unit_to_spawn : PackedScene
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if unit_to_spawn == null:
		push_error(name + ": No unit was set to spawn, please set a unit to spawn")
		return
		
	var spawned_unit = unit_to_spawn.instantiate()
	
	if spawned_unit == null:
		push_error(name + ": Cannot spawn unit, it is null!")
		return
	
	add_child(spawned_unit)
#endregion
