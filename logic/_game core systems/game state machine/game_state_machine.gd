class_name GameStateMachine
extends StateMachine

## Description: The purpose of this script is to handle the game states and 
## their transitions.
## Filename: game_state_machine.gd
## Author(s): Matthew Perry,
## Last Updated: 09/18/2026

#region export variables (snake_case):

@export var main_menu : IState

#endregion


#region (optional) build in virtural methods:

func _ready() -> void:
	super()
	ManagerSignalBus.return_to_main_menu.connect(return_to_main_menu)

#endregion

#region public methods (non underscore prefixed snake_case):
func return_to_main_menu() -> void:
	if not is_instance_valid(main_menu):
		push_error(name + ": Please assign Main Menu!")
		return
	
	if _current_state:
		_current_state.exit()
	
	_current_state = main_menu
	_current_state.enter()

#endregion
