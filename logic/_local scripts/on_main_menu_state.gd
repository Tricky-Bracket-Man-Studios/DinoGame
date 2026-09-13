extends IState

## Description: The purpose of this script is to handle the state of the game
## when on the main menu
## Filename: on_main_menu_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region constants (CONSTANT_CASE):
const MAIN_MENU_HUD : String = "uid://cij05tkirhkac"
const BATTLE_MENU_STATE : String = "OnBattleMenu"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.change_game_state_request.connect(_start_game)
	ManagerSignalBus.load_menu.emit(MAIN_MENU_HUD)

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.change_game_state_request.disconnect(_start_game)
#endregion

#region private variables (undersocre prefixed snake_case):
func _start_game() -> void:
	change_state.emit(self, BATTLE_MENU_STATE)
#endregion
