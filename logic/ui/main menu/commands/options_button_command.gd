extends IButtonCommand

## Description: The purpose of this script is to define the logic that runs
## when the start button is pressed.
## Filename: options_button_command.gd
## Author(s): Matthew Perry,
## Last Updated: 10/01/2026

#region constants (CONSTANT_CASE):
const OPTIONS_PANEL : String = "OptionsPanel"
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
#endregion

#region public methods (non underscore prefixed snake_case):
func execute() -> void:
	ManagerSignalBus.enable_menu_request.emit(OPTIONS_PANEL)

func undo() -> void:
	pass
#endregion

#region private methods (undersocre prefixed snake_case):
func _on_button_pressed() -> void:
	on_button_pressed.emit(self)
#endregion
