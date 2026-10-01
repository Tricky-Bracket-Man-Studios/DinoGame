class_name MainMenuHUDLogic
extends Control
## Description: The purpose of this script is to hold the logic for the main menu.
## Filename: main_menu_hud_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 10/01/2026

#region export variables (snake_case):
@export var buttons_root : Control
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if not is_instance_valid(buttons_root):
		push_error(name + ": please assign the buttons root for this menu!")
		return
	
	for button in buttons_root.get_children():
		if button is IButtonCommand:
			button.on_button_pressed.connect(_on_button_pressed)
#endregion

#region private methods (undersocre prefixed snake_case):
func _on_button_pressed(command : IButtonCommand) -> void:
	command.execute()
#endregion
