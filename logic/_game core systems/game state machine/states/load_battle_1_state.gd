extends IState

## Description: The purpose of this script is to handle the state of the game
## when loading the first battle.
## Filename: load_battle_1_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region constants (CONSTANT_CASE):

#const MAIN_MENU_HUD : String = "uid://cij05tkirhkac"

const BATTLE_MENU_STATE : String = "OnBattleMenu"

#endregion

#region export variables (snake_case):

@export var enemy_dino : PackedScene

#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.change_game_state_request.connect(_start_battle)
	ManagerSignalBus.set_enemy_dino_request.emit(enemy_dino)
	_start_battle()

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.change_game_state_request.disconnect(_start_battle)
		

#endregion

#region private variables (undersocre prefixed snake_case):

func _start_battle() -> void:
	change_state.emit(self, BATTLE_MENU_STATE)
	
#endregion
