class_name EnemyUnitSpawner
extends UnitSpawner

## Description: The purpose of this script is to have set locations where the 
## enemy units spawn and to control the logic behind it spawning.
## Filename: enemy_unit_spawner.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region (optional) build in virtural methods:

func _ready() -> void:
	ManagerSignalBus.deliver_enemy_dino.connect(_spawn_enemy_unit)
	ManagerSignalBus.get_enemy_dino_request.emit()

#endregion

#region private methods (undersocre prefixed snake_case):

func _spawn_enemy_unit(dino_object : PackedScene) -> void:
	unit_to_spawn = dino_object
	
	await get_tree().create_timer(3).timeout
	_spawn_unit()

	ManagerSignalBus.spawned_enemy_dino.emit.call_deferred(unit_uid)

#endregion
