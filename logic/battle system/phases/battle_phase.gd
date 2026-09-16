extends IBattleState

## Description: The purpose of this script is to take in the input from the 
## previous phase and calcualte the effects on the dinos.
## Filename: battle_phase.gd
## Author(s): Matthew Perry,
## Last Updated: 09/16/2026

#region constants (CONSTANT_CASE):
const DEFENSE_PHASE : String = "DefensePhase"
const ATTACK_PHASE : String = "AttackPhase"
const BATTLE_WON_PHASE : String = "BattleWonPhase"
const BATTLE_LOSS_PHASE : String = "BattleLossPhase"
#endregion

#region public methods (non underscore prefixed snake_case):
func enter() -> void:
	ManagerSignalBus.trigger_battle_loss_phase.connect(_on_battle_loss)
	ManagerSignalBus.trigger_battle_won_phase.connect(_on_battle_won)
	ManagerSignalBus.calculated_battle_request.connect(_calculated_battle_request)
	ManagerSignalBus.calculate_battle_request.emit()

func process(_delta: float) -> void:
	pass

func exit() -> void:
	ManagerSignalBus.trigger_battle_loss_phase.disconnect(_on_battle_loss)
	ManagerSignalBus.trigger_battle_won_phase.disconnect(_on_battle_won)
	ManagerSignalBus.calculated_battle_request.disconnect(_calculated_battle_request)

#endregion
#region private methods (undersocre prefixed snake_case):
func _calculated_battle_request() -> void:
	if previous_state_name == ATTACK_PHASE.to_lower():
		change_state.emit(self, DEFENSE_PHASE)
	if previous_state_name == DEFENSE_PHASE.to_lower():
		change_state.emit(self, ATTACK_PHASE)
		
func _on_battle_loss() -> void:
	change_state.emit(self, BATTLE_LOSS_PHASE)

func _on_battle_won() -> void:
	change_state.emit(self, BATTLE_WON_PHASE)
#endregion
