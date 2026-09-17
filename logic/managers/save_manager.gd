class_name SaveManger
extends Node

## Description: The purpose of this script is to manage how saving the state of
## the game. This will handle progress in battle, and save slots, etc.
## Filename: save_manager.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026


#region constants (CONSTANT_CASE):

const SAVE_SLOT_0_PATH : String = "res://save data/slot 0.dat"

@warning_ignore("unused_variable")
const SAVE_SLOT_1_PATH : String = "res://save data/slot 1.dat"

@warning_ignore("unused_variable")
const SAVE_SLOT_2_PATH : String = "res://save data/slot 2.dat"

#endregion

#region (optional) build in virtural methods:

func _ready() -> void:
	var testSaveData : Dictionary = {
		"String": "empty",
		"Int": 123,
		"Dictionary": {
			"testing": 123
		}
	}
	
	_save_data(testSaveData, SAVE_SLOT_0_PATH)
	var save_data : Dictionary = _load_data(SAVE_SLOT_0_PATH)

#endregion

#region private methods (undersocre prefixed snake_case):

func _save_data(saveData : Dictionary, saveSlot : String) -> void:
	var file = FileAccess.open(saveSlot, FileAccess.WRITE)
	
	if file:
		var savedfile = file.store_var(saveData)
		file.close()

	else:
		push_error(name + ": An error occurred while trying to save.")

func _load_data(saveSlot : String) -> Dictionary:
	var saveData : Dictionary = {}
	
	if not FileAccess.file_exists(saveSlot):
		push_error(name + ": No save file found.")
		return {}
		
	var file = FileAccess.open(saveSlot, FileAccess.READ)
	
	if file:
		var loadedData = file.get_var()
		file.close()
		
		saveData = loadedData

	return saveData

#endregion
