extends IState

## Description: The purpose of this script is to handle the state of the game
## when on the main menu
## Filename: on_battle_menu_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/16/2026

#region constants (CONSTANT_CASE):
const BATTLE_MENU_UI : String = "uid://bhpmunnatpoaf"
const BATTLE_MENU_LEVEL : String = "uid://0usuedl4d18t"
const BATTLE_MENU_SYSTEMS : String = "uid://dcpnglbr72cr1"
const BATTLE_MENU_STATE : String = "OnBattleMenu"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
		ManagerSignalBus.load_menu.emit(BATTLE_MENU_UI)
		ManagerSignalBus.load_level.emit(BATTLE_MENU_LEVEL)
		ManagerSignalBus.load_system.emit(BATTLE_MENU_SYSTEMS)
		ManagerSignalBus.change_game_state_request.connect(_start_game)

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.change_game_state_request.disconnect(_start_game)
	ManagerSignalBus.unload_units.emit()
#endregion

func _start_game() -> void:
	
	change_state.emit(self, BATTLE_MENU_STATE)
