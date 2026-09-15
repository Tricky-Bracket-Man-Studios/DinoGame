class_name PlayerUnitSpawner
extends UnitSpawner

## Description: The purpose of this script is to have set locations where the 
## player units spawn and to control the logic behind it spawning.
## Filename: player_unit_spawner.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

#region (optional) build in virtural methods:

func _ready() -> void:
	print(self.position)
	_spawn_unit()
	
	ManagerSignalBus.spawned_player_dino.emit(unit_uid)

#endregion
