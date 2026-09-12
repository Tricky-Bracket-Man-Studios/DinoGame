extends BaseLevel

## Description: The purpose of this script is to hold the logic for the main menu.
## Filename: main_menu.gd
## Author(s): Matthew Perry,
## Last Updated: 09/07/2026

#region constants (CONSTANT_CASE):
const BATTLE_MENU : String = "uid://d0xl27pl6mfr2"
#endregion

#region export variables (snake_case):
@export var _start_button 	: Button
@export var _options_button : Button
@export var _quit_button 	: Button
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if _start_button == null:
		push_error("Start Button is not assigned!")
		return
		
	if _options_button == null:
		push_error("Options Button is not assigned!")
		return
		
	if _quit_button == null:
		push_error("Quit Button is not assigned!")
		return
	
	_start_button.pressed.connect(_on_start_button_pressed)
	# TODO: add options button here.
	# TODO: add quit button here.
#endregion

#region private methods (undersocre prefixed snake_case):

func _on_start_button_pressed() -> void:
	print("MainMenu: Start was Pressed, I am emitting a signal now!")
	ManagerBus.start_button_pressed.emit(BATTLE_MENU)
	

#endregion
