class_name BattleSelectMenuHUDLogic
extends Control

## Description: The purpose of this script is to hold the logic for the main menu.
## Filename: battle_select_menu_hud_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region constants (CONSTANT_CASE):
const BATTLE_MENU : String = "uid://d0xl27pl6mfr2"
#endregion

#region export variables (snake_case):
@export var battle1 : Button
#endregion

#region private variables (undersocre prefixed snake_case):
var _buttons_array : Array[Button] = [battle1]
var _buttons_are_valid : bool = true
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	_validate_buttons(_buttons_array)
	
	if _buttons_are_valid:
		battle1.pressed.connect(_on_battle1_button_pressed)
	else:
		return
#endregion

#region private methods (undersocre prefixed snake_case):
func _on_battle1_button_pressed() -> void:
	ManagerSignalBus.change_game_state_request.emit()
	
func _validate_buttons(buttons : Array[Button]) -> void:
	for button in buttons:
		if not is_instance_valid(button):
			push_error(name + ": a button is not assigned")
			_buttons_are_valid = false
#endregion
