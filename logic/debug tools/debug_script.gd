extends Node

## Description: The purpose of this script is to hold code relating to testing 
## systems and UI, quick and dirty.
## Filename: debug_script.gd
## Author(s): Matthew Perry,
## Last Updated: 10/01/2026

#region export variables (snake_case):
#endregion

#region private variables (undersocre prefixed snake_case):
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if not OS.is_debug_build():
		return
	
	ManagerSignalBus.enable_menu_request.connect(_on_enable_menu_request)
	
func _input(event: InputEvent) -> void:
	if not OS.is_debug_build():
		return
	
	if event.is_action_pressed(&"debug_quit"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()
#endregion

#region private methods (undersocre prefixed snake_case):

func _on_enable_menu_request(menu : String) -> void:
	print(name + ": this is when the " + menu + " menu would be shown...")

#endregion
