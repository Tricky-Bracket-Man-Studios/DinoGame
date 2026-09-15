extends IBattleState

## Description: The purpose of this script is to take in the input from the 
## previous phase and calcualte the effects on the dinos.
## Filename: battle_phase.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region constants (CONSTANT_CASE):
const DEFENSE_PHASE : String = "DefensePhase"
const ATTACK_PHASE : String = "AttackPhase"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.calculated_battle_request.connect(_calculated_battle_request)
	ManagerSignalBus.calculate_battle_request.emit()

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.calculated_battle_request.disconnect(_calculated_battle_request)

#endregion
#region private methods (undersocre prefixed snake_case):
func _calculated_battle_request() -> void:
	if previous_state_name == ATTACK_PHASE.to_lower():
		change_state.emit(self, DEFENSE_PHASE)
	else:
		change_state.emit(self, ATTACK_PHASE)
#endregion
