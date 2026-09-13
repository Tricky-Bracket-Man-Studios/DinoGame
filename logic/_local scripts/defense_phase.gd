extends IBattleState

## Description: The purpose of this script is to take in the input from the 
## player and pass it to the defense phase.
## Filename: defense_phase.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region constants (CONSTANT_CASE):
const BATTLE_PHASE : String = "BattlePhase"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.change_battle_state_request.connect(_change_battle_phase)
	ManagerSignalBus.enable_defense_phase_hud_request.emit()

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.change_battle_state_request.disconnect(_change_battle_phase)
	ManagerSignalBus.disable_defense_phase_hud_request.emit()

#endregion

#region private methods (undersocre prefixed snake_case):
func _change_battle_phase() -> void:
	change_state.emit(self, BATTLE_PHASE)
#endregion
