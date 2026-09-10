class_name BattleStateMachine
extends Node

## Description: The purpose of this script is to handle the states of each battle
## Filename: battle_state_machine.gd
## Author(s): Matthew Perry,
## Last Updated: 09/10/2026

#region export variables (snake_case):
@export var default_state : BattleState
#endregion

#region private variables (undersocre prefixed snake_case):
var _current_state : BattleState
var _battle_states : Dictionary = {}
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	for child in get_children():
		if child is BattleState:
			_battle_states[child.name.to_lower()] = child
			child.change_battle_state.connect(on_battle_state_change)
	if default_state:
		_current_state = default_state
		_current_state.enter()
#endregion

func on_battle_state_change(current_battle_state : BattleState, new_battle_state_name):
	if current_battle_state != _current_state:
		return
		
	var new_state : BattleState = _battle_states.get(new_battle_state_name.to_lower())
	if not is_instance_valid(new_state):
		return
	
	if _current_state:
		_current_state.exit()
	
	_current_state = new_state
	new_state.enter()
