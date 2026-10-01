@abstract
class_name ICommand
extends Node

## Description: The purpose of this script is to define the minimum a command should have
## for scripts to interface with them.
## Filename: command_interface.gd
## Author(s): Matthew Perry,
## Last Updated: 10/01/2026

#region public methods (non underscore prefixed snake_case):
@abstract func execute() -> void

@abstract func undo() -> void
#endregion
