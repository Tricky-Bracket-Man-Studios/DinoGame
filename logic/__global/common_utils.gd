extends Node

## Description: The purpose of this script is to house common useful methods.
## Filename: common_utils.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region public methods (non underscore prefixed snake_case):
func get_uid_from_scene(packed_scene : PackedScene) -> String:
	if not is_instance_valid(packed_scene):
		push_error(name + ": No unit was set to spawn, please set a unit to spawn")
		return ""
	
	var file_path : String = packed_scene.resource_path
	
	var uid_int : int = ResourceLoader.get_resource_uid(file_path)
	
	var uid : String = ResourceUID.id_to_text(uid_int)
	
	return uid
#endregion
