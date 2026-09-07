extends Node

## Description: The purpose of this script is to hold code relating to testing 
## systems and UI, quick and dirty.
## Filename: debug_script.gd
## Author(s): Matthew Perry,
## Last Updated: 09/07/2026

#region (optional) build in virtural methods:
func _ready() -> void:
	#ManagerBus.start_button_pressed.connect(_handle_startbutton_action)
	pass
#endregion

#region private methods (undersocre prefixed snake_case):
func _handle_startbutton_action() -> void:
	print("Debug: I heard the emitted start button signal!")
	pass

#endregion
