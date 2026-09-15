class_name StateMachine
extends Node

## Description: The purpose of this script is to handle the states and their
## transitions.
## Filename: state_machine.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region export variables (snake_case):
@export var default_state : IState
#endregion

#region private variables (undersocre prefixed snake_case):
var _current_state : IState
var _states : Dictionary = {}
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	for child in get_children():
		if child is IState:
			_states[child.name.to_lower()] = child
			child.change_state.connect(on_state_change)
	if default_state:
		_current_state = default_state
		_current_state.enter.call_deferred()

func _process(delta: float) -> void:
	if is_instance_valid(_current_state):
		_current_state.process(delta)
#endregion

#region public methods (non underscore prefixed snake_case):
func on_state_change(current_state : IState, new_state_name):
	if current_state != _current_state:
		return
		
	var new_state : IState = _states.get(new_state_name.to_lower())
	if not is_instance_valid(new_state):
		return
	
	if _current_state:
		_current_state.exit()
	
	_current_state = new_state
	new_state.enter()
#endregion
