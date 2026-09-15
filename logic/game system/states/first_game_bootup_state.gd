extends IState

## Description: The purpose of this script is to handle the state of the game
## when first booting up.
## Filename: first_game_bootup_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/12/2026

#region constants (CONSTANT_CASE):
const MAIN_MENU_STATE : String = "OnMainMenu"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	change_state.emit(self, MAIN_MENU_STATE)

func process(_delta: float) -> void:
	pass

func exit() -> void:
	pass
		

#endregion
