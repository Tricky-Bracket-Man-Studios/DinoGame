class_name BattleCalculator
extends Node

## Description: The purpose of this script is to calculate battles
## Filename: battle_calculator.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

#region private variables (undersocre prefixed snake_case):
var _players_dino : IDino = null
var _enemys_dino : IDino = null

var _players_dino_uid : String = ""
var _enemys_dino_uid : String = ""
#endregion

#region (optional) build in virtural methods:

func _ready() -> void:
	ManagerSignalBus.calculate_battle_request.connect(_calculate_battle)
	ManagerSignalBus.spawned_player_dino.connect(_capture_player_dino)
	ManagerSignalBus.spawned_enemy_dino.connect(_capture_enemy_dino)
	ManagerSignalBus.deliver_unit.connect(_set_dino)

#endregion

#region private methods (undersocre prefixed snake_case):
func _calculate_battle() -> void:
	if is_instance_valid(_enemys_dino) && is_instance_valid(_players_dino):
		match _players_dino._current_stance:
			IDino.DinoBattleStance.ATTACK:
				print(name + ": attacked!")
				
				_enemys_dino._current_stance = randi_range(4, 6)
				
				match _enemys_dino._current_stance:
					IDino.DinoBattleStance.DEFEND:
						print(_enemys_dino.name + ": I chose " + IDino.DinoBattleStance.find_key(_enemys_dino._current_stance))
						print(_players_dino._attack - _enemys_dino._defense)
					IDino.DinoBattleStance.SPECIAL_DEFEND:
						print(_enemys_dino.name + ": I chose " + IDino.DinoBattleStance.find_key(_enemys_dino._current_stance))
						print(_players_dino._attack - (_enemys_dino._special_defense / 2))
					IDino.DinoBattleStance.NULL_DEFEND:
						print(_enemys_dino.name + ": I chose " + IDino.DinoBattleStance.find_key(_enemys_dino._current_stance))
						print(_players_dino._attack - 0)
					_:
						push_error(
							name + ": error, unknown state entered" + str(_players_dino._current_stance)
						)
			IDino.DinoBattleStance.SPECIAL_ATTACK:
				print(name + ": special attacked!")
				_enemys_dino._current_stance = randi_range(4, 6)
			IDino.DinoBattleStance.ULTIMATE_ATTACK:
				print(name + ": ultimate attacked!")
				_enemys_dino._current_stance = randi_range(4, 6)
			IDino.DinoBattleStance.DEFEND:
				print(name + ": defended!")
				_enemys_dino._current_stance = randi_range(1, 3)
			IDino.DinoBattleStance.SPECIAL_DEFEND:
				print(name + ": special defended!")
				_enemys_dino._current_stance = randi_range(1, 3)
			IDino.DinoBattleStance.NULL_DEFEND:
				print(name + ": null defended!")
				_enemys_dino._current_stance = randi_range(1, 3)
			_:
				push_error(
					name + ": error, unknown state entered" + str(_players_dino._current_stance)
				)
				
		ManagerSignalBus.calculated_battle_request.emit()

func _capture_player_dino(players_dino_uid : String) -> void:
	_players_dino_uid = players_dino_uid
	ManagerSignalBus.get_unit_request.emit(_players_dino_uid)

func _capture_enemy_dino(enemys_dino_uid : String) -> void:
	_enemys_dino_uid = enemys_dino_uid
	ManagerSignalBus.get_unit_request.emit(_enemys_dino_uid)
	
func _set_dino(dino_uid : String, dino_unit : Node2D) -> void:
	if _enemys_dino_uid != "":
		if dino_uid == _enemys_dino_uid:
			_enemys_dino = dino_unit

	if _players_dino_uid != "":
		if dino_uid == _players_dino_uid:
			_players_dino = dino_unit
#endregion
