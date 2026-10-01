extends IButtonCommand

## Description: The purpose of this script is to define the logic that runs
## when the quit button is pressed.
## Filename: quit_button_command.gd
## Author(s): Matthew Perry,
## Last Updated: 10/01/2026

#region (optional) build in virtural methods:
func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
#endregion

#region public methods (non underscore prefixed snake_case):
func execute() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func undo() -> void:
	pass
#endregion

#region private methods (undersocre prefixed snake_case):
func _on_button_pressed() -> void:
	on_button_pressed.emit(self)
#endregion
