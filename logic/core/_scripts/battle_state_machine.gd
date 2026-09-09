class_name BattleStateMachine
extends Node

## Description: The purpose of this script is to handle the states of each battle
## Filename: battle_state_machine.gd
## Author(s): Matthew Perry,
## Last Updated: 09/09/2026

#region export variables (snake_case):
@export var default_state : BattleState
#endregion

#region private variables (undersocre prefixed snake_case):
var _current_state : BattleState
var _battle_states : Dictionary = {}
#endregion
