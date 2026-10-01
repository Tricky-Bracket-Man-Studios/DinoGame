class_name MainMenuHUDLogic
extends Control
## Description: The purpose of this script is to hold the logic for the main menu.
## Filename: main_menu_hud_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 09/28/2026

#region constants (CONSTANT_CASE):
const BATTLE_SELECT_STATE : String = "BattleSelect"
#endregion

#region export variables (snake_case):
@export var start_button 	: Button
@export var options_button : Button
@export var quit_button 	: Button
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if _validate_buttons():
		start_button.pressed.connect(_on_start_button_pressed)
		options_button.pressed.connect(_on_options_button_pressed)
		quit_button.pressed.connect(_on_quit_button_pressed)
	else:
		return
#endregion

#region private methods (undersocre prefixed snake_case):
func _on_start_button_pressed() -> void:
	ManagerSignalBus.change_game_state_request.emit(BATTLE_SELECT_STATE)

func _on_options_button_pressed() -> void:
	pass
	
func _on_quit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
	
func _validate_buttons() -> bool:
	var buttons : Array[Button] = [start_button, options_button, quit_button]
	
	for button in buttons:
		if not is_instance_valid(button):
			push_error(name + ": '" + button.name + "' is not assigned")
			return false
	return true
#endregion
