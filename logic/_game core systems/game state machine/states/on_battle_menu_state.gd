extends IState

## Description: The purpose of this script is to handle the state of the each
## battle, setup and the flow of each state.
## Filename: on_battle_menu_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region constants (CONSTANT_CASE):
const BATTLE_MENU_UI : String = "uid://bhpmunnatpoaf"
const BATTLE_MENU_LEVEL : String = "uid://0usuedl4d18t"
const BATTLE_MENU_SYSTEMS : String = "uid://dcpnglbr72cr1"
const BATTLE_MENU_STATE : String = "OnBattleMenu"
const BATTLE_SELECT_MENU_STATE : String = "BattleSelect"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
		ManagerSignalBus.load_menu.emit(BATTLE_MENU_UI)
		ManagerSignalBus.load_level.emit(BATTLE_MENU_LEVEL)
		ManagerSignalBus.load_system.emit(BATTLE_MENU_SYSTEMS)
		
		ManagerSignalBus.change_game_state_battle_menu.connect(_change_state_to_battle_menu)
		ManagerSignalBus.change_game_state_battle_select.connect(_change_state_to_battle_select)

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.change_game_state_battle_menu.disconnect(_change_state_to_battle_menu)
	ManagerSignalBus.change_game_state_battle_select.disconnect(_change_state_to_battle_select)
	
	ManagerSignalBus.unload_units.emit()
	ManagerSignalBus.unload_level.emit()
	ManagerSignalBus.unload_menu.emit()
	ManagerSignalBus.unload_system.emit()
#endregion

func _change_state_to_battle_menu() -> void:
	change_state.emit(self, BATTLE_MENU_STATE)
	
func _change_state_to_battle_select() -> void:
	change_state.emit(self, BATTLE_SELECT_MENU_STATE)
