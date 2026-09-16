extends StateMachine

## Description: The purpose of this script is to handle the battle states and 
## their transitions.
## Filename: battle_state_machine.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region private variables (undersocre prefixed snake_case):
var _previous_state_name : String
#endregion

#region public methods (non underscore prefixed snake_case):
func on_state_change(current_state : IState, new_state_name):
	if current_state != _current_state:
		return
		
	var new_state : IBattleState = _states.get(new_state_name.to_lower())
	if not is_instance_valid(new_state):
		return
	
	if _current_state:
		_current_state.exit()
	
	_previous_state_name = _current_state.name.to_lower()
	_current_state = new_state
	
	new_state.previous_state_name = _previous_state_name.to_lower()
	new_state.enter()
#endregion
