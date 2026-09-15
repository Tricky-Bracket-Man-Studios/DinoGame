@abstract 
class_name IState
extends Node

## Description: The purpose of this script is to define what minimums a state
## needs to interface with managers.
## Filename: state_interface.gd
## Author(s): Matthew Perry,
## Last Updated: 09/12/2026

#region signals (snake_case):
@warning_ignore("unused_signal")
signal change_state(state : IState, new_state : String)
#endregion

#region public methods (non underscore prefixed snake_case):
@abstract func enter() -> void
@abstract func exit() -> void
@abstract func process(delta: float) -> void
#endregion
