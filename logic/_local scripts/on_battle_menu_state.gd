extends IState

## Description: The purpose of this script is to handle the state of the game
## when on the main menu
## Filename: on_battle_menu_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/12/2026

#region constants (CONSTANT_CASE):
const BATTLE_MENU_UI : String = "uid://bhpmunnatpoaf"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.load_menu.emit(BATTLE_MENU_UI)
	print(name + ": emiting signal!")

func process(_delta: float) -> void:
	pass

func exit() -> void:
	pass

#endregion
