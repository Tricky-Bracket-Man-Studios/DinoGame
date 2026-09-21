extends IBattleState

## Description: The purpose of this script is to handle what happens on a win.
## Filename: battle_won_phase.gd
## Author(s): Matthew Perry,
## Last Updated: 09/16/2026


#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.enable_victory_menu.emit()

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.disable_victory_menu.emit()

#endregion
#region private methods (undersocre prefixed snake_case):
#endregion
