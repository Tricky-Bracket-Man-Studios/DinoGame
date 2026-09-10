@abstract 
class_name BattleState
extends Node

## Description: The purpose of this script is to define what happens in a state,
## and what how to handle each state.
## Filename: battle_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/10/2026

#region signals (snake_case):
signal change_battle_state(current_battle_state : BattleState, new_battle_state_name : String)
#endregion

#region public methods (non underscore prefixed snake_case):
@abstract func enter() -> void
@abstract func exit() -> void
#endregion
