extends Node

## Description: The purpose of this script is to hold all relevant signals for managers
## Filename: manager_signal_bus.gd
## Author(s): Matthew Perry,
## Last Updated: 09/11/2026

#region signals (snake_case):
@warning_ignore("unused_signal")
signal load_menu(menu : String)

@warning_ignore("unused_signal")
signal return_to_main_menu()

@warning_ignore("unused_signal")
signal load_level(level : String)

@warning_ignore("unused_signal")
signal change_game_state_request()
#endregion
