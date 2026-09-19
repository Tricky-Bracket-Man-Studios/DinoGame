extends IState

## Description: The purpose of this script is to handle the state of the game
## when selecting a battle
## Filename: battle_select_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region constants (CONSTANT_CASE):

const BATTLE_SELECT_MENU_HUD : String = "uid://bpm1ypat5ql3h"

const LOAD_BATTLE_1_STATE : String = "LoadBattle1"

#endregion

#region export variables (snake_case):

@export var enemy_dino : PackedScene

#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.trigger_battle_1.connect(_start_battle_1)
	ManagerSignalBus.load_menu.emit(BATTLE_SELECT_MENU_HUD)

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.trigger_battle_1.disconnect(_start_battle_1)
	ManagerSignalBus.unload_menu.emit()
		

#endregion

#region private variables (undersocre prefixed snake_case):

func _start_battle_1() -> void:
	change_state.emit(self, LOAD_BATTLE_1_STATE)
	
#endregion
