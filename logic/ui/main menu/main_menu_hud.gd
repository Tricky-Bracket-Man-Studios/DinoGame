extends Control
## Description: The purpose of this script is to hold the logic for the main menu.
## Filename: main_menu_hud.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region constants (CONSTANT_CASE):
const BATTLE_MENU : String = "uid://d0xl27pl6mfr2"
#endregion

#region export variables (snake_case):
@export var start_button 	: Button
@export var options_button : Button
@export var quit_button 	: Button
#endregion

#region private variables (undersocre prefixed snake_case):
var _buttons_are_valid : bool = true
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	_validate_buttons()
	
	if _buttons_are_valid:
		start_button.pressed.connect(_on_start_button_pressed)
		# TODO: add options button here.
		# TODO: add quit button here.
	else:
		return
#endregion

#region private methods (undersocre prefixed snake_case):
func _on_start_button_pressed() -> void:
	ManagerSignalBus.change_game_state_request.emit()
	
func _validate_buttons() -> void:
	var buttons : Array = [start_button, options_button, quit_button]
	for button in buttons:
		if not is_instance_valid(button):
			push_error(name + ": a button is not assigned")
			_buttons_are_valid = false
#endregion
