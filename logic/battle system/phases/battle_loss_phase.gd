extends IBattleState

## Description: The purpose of this script is to handle what happens on a loss.
## Filename: battle_won_phase.gd
## Author(s): Matthew Perry,
## Last Updated: 09/16/2026


#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	print(name + ": Battle Loss!")
	ManagerSignalBus.enable_retry_menu.emit()

func process(_delta: float) -> void:
	pass

func exit() -> void:
	pass

#endregion
#region private methods (undersocre prefixed snake_case):
#endregion
