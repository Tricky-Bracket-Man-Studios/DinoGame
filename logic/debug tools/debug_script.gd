extends Node

## Description: The purpose of this script is to hold code relating to testing 
## systems and UI, quick and dirty.
## Filename: debug_script.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region export variables (snake_case):
#endregion

#region private variables (undersocre prefixed snake_case):
var _players_dino_stance : String = "" 
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if not OS.is_debug_build():
		return
	
	ManagerSignalBus.change_players_dino_stance.connect(_change_players_dino_stance)
	ManagerSignalBus.calculate_battle_request.connect(_calculate_dino_battle)
	
func _input(event: InputEvent) -> void:
	if not OS.is_debug_build():
		return
	
	if event.is_action_pressed(&"debug_quit"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()
#endregion

#region private methods (undersocre prefixed snake_case):
func _change_players_dino_stance(new_stance : String) -> void:
	_players_dino_stance = new_stance
	print(name + ": player's dino stance is now " + _players_dino_stance)
	
func _calculate_dino_battle() -> void:
	print(name + ": Idk bro roll your own die!")
	ManagerSignalBus.calculated_battle_request.emit()
#endregion
