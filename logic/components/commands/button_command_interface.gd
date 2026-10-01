@abstract
class_name IButtonCommand
extends Button

## Description: The purpose of this script is to define the minimum a button 
## command should have for scripts to interface with them.
## Filename: button_command_interface.gd
## Author(s): Matthew Perry,
## Last Updated: 10/01/2026

#region signals (snake_case):
@warning_ignore("unused_signal")
signal on_button_pressed(command : IButtonCommand)
#endregion

#region public methods (non underscore prefixed snake_case):
@abstract func execute() -> void

@abstract func undo() -> void
#endregion

#region private methods (undersocre prefixed snake_case):
@abstract func _on_button_pressed() -> void
#endregion
