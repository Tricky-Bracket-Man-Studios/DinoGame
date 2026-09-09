@abstract 
class_name BattleState
extends Node

## Description: The purpose of this script is to define what happens in a state,
## and what how to handle each state.
## Filename: battle_state.gd
## Author(s): Matthew Perry,
## Last Updated: 09/09/2026

#region signals (snake_case):
signal change_battle_state(battle_state : BattleState)
#endregion

#region private methods (undersocre prefixed snake_case):
@abstract func _enter() -> void
@abstract func _exit() -> void
#endregion
