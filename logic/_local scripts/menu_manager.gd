class_name MenuManager
extends Node

## Description: The purpose of this script is to orcastrate menus for the game.
## Filename: menu_manager.gd
## Author(s): Matthew Perry,
## Last Updated: 09/12/2026

#region constants (CONSTANT_CASE):
const MAIN_MENU : String = "uid://cij05tkirhkac" # Default Menu
#endregion

#region private variables (undersocre prefixed snake_case):
var _current_menu : Control = null
#endregion

#region export variables (snake_case):
@export var hud_layer : CanvasLayer
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	ManagerSignalBus.load_menu.connect(load_menu)
	ManagerSignalBus.return_to_main_menu.connect(return_to_main_menu)
#endregion

#region public methods (non underscore prefixed snake_case):
func return_to_main_menu() -> void:
	if not is_instance_valid(MAIN_MENU):
		push_error(name + ": Main Menu uid is invalid, double check it" + MAIN_MENU)
		return
	load_menu(MAIN_MENU)

func load_menu(menu_object : String) -> void:
	_perform_load_menu.call_deferred(menu_object)
#endregion
	
#region private methods (undersocre prefixed snake_case):
func _perform_load_menu(menu_object_uid : String) -> void:
	if is_instance_valid(_current_menu):
		_current_menu.queue_free()
		_current_menu = null
		
		# Wait to allow the queued deletion to process so it is out of the scene tree
		await get_tree().process_frame
	
	var new_menu_packed : PackedScene = (
			ResourceLoader.load(menu_object_uid, "PackedScene") as PackedScene
	)
	
	if new_menu_packed == null:
		push_error("Could not load menu as a packed scene: " + menu_object_uid + ". Returning to Main Menu")
		if menu_object_uid != MAIN_MENU:
			load_menu(MAIN_MENU)
		return
		
	var new_menu : Node = new_menu_packed.instantiate()
	
	if not new_menu:
		push_error("Could not instantiate new menu " + menu_object_uid)
		if menu_object_uid != MAIN_MENU:
			load_menu(MAIN_MENU)
		return
		
		
	if new_menu is not Control:
		new_menu.free()  # Level must be freed to avoid unreferenced orphan nodes
		push_error("Loaded menu is not of type IMenu " + menu_object_uid)
		if menu_object_uid != MAIN_MENU:
			load_menu(MAIN_MENU)
		return
	
	_current_menu = new_menu as Control
	
	if not is_instance_valid(hud_layer):
		push_error(name + ": Hud Layer not Assigned!")
		return
		
	hud_layer.add_child(_current_menu)
#endregion
