class_name PlayerUnitSpawner
extends UnitSpawner

## Description: The purpose of this script is to have set locations where the 
## player units spawn and to control the logic behind it spawning.
## Filename: player_unit_spawner.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region (optional) build in virtural methods:

func _ready() -> void:
	ManagerSignalBus.deliver_player_dino.connect(_spawn_player_unit)
	ManagerSignalBus.get_player_dino_request.emit()

#endregion

#region private methods (undersocre prefixed snake_case):

func _spawn_player_unit(dino_object : PackedScene) -> void:
	unit_to_spawn = dino_object
	
	await get_tree().create_timer(3).timeout
	
	_spawn_unit()

	ManagerSignalBus.spawned_player_dino.emit.call_deferred(unit_uid)

#endregion
