extends IBattleState

## Description: The purpose of this script is to allow logic to run before the 
## attack phase.
## Filename: enter_battle_phase.gd
## Author(s): Matthew Perry,
## Last Updated: 09/21/2026

#region constants (CONSTANT_CASE):
const ATTACK_PHASE : String = "AttackPhase"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	await get_tree().create_timer(3).timeout
	change_state.emit(self, ATTACK_PHASE)

func process(_delta: float) -> void:
	pass

func exit() -> void:
	pass
	

#endregion

#region private methods (undersocre prefixed snake_case):
#endregion
