extends Node2D

## Description: The purpose of this script is to orcastrate the game from a 
## high level.
## Filename: main_game.gd
## Author(s): Matthew Perry,
## Last Updated: 09/11/2026

#region Variables:
const MAIN_MENU   : String = "uid://cs3wjisow5ssf"
const BATTLE_MENU : String = "uid://d0xl27pl6mfr2"

var _current_level : ILevel = null

# Game World Root Nodes:
@onready var level_root  : Node2D = $World/LevelRoot
@onready var unit_root   : Node2D = $World/UnitRoot
@onready var effect_root : Node2D = $World/EffectRoot

# UI Root Nodes:
@onready var hud_layer        : CanvasLayer = $HudLayer
@onready var pause_layer      : CanvasLayer = $PauseLayer
@onready var transition_layer : CanvasLayer = $TransitionLayer
@onready var debug_layer      : CanvasLayer = $DebugLayer
#endregion

#region Built in Methods:
func _input(event: InputEvent) -> void:
	if not OS.is_debug_build():
		return
	if event.is_action_pressed(&"debug_quit"):
		quit_game()
		
func _ready() -> void:
	load_level(MAIN_MENU)
	ManagerBus.connect("start_button_pressed", load_level)
#endregion

#region Private Methods:
func quit_game() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

func load_level(level_scene : String) -> void:
	_perform_load_level.call_deferred(level_scene)
	
func _perform_load_level(level_scene_uid : String) -> void:
	if is_instance_valid(_current_level):
		_current_level.queue_free()
		_current_level = null
		
		# Wait to allow the queued deletion to process so it is out of the scene tree
		await get_tree().process_frame
	
	var new_level_packed : PackedScene = (
			ResourceLoader.load(level_scene_uid, "PackedScene") as PackedScene
	)
	
	if new_level_packed == null:
		push_error("Could not load level as a packed scene: " + level_scene_uid)
		_perform_load_fall_back()
		
	var new_level : Node = new_level_packed.instantiate()
	
	if not new_level:
		push_error("Could not instantiate new level " + level_scene_uid)
		_perform_load_fall_back()
		
	if new_level is not ILevel:
		new_level.free()  # Level must be freed to avoid unreferenced orphan nodes
		push_error("Loaded level is not of type BaseLevel " + level_scene_uid)
		_perform_load_fall_back()
	
	_current_level = new_level as ILevel
	
	level_root.add_child(_current_level)
	
func _perform_load_fall_back() -> void:
	var level_scene_uid : String = MAIN_MENU
	
	var new_level_packed : PackedScene = (
			ResourceLoader.load(level_scene_uid, "PackedScene") as PackedScene
	)
	
	if new_level_packed == null:
		push_error("Could not load level as a packed scene: " + level_scene_uid)
		return
	
	var new_level : Node = new_level_packed.instantiate()
	
	if not new_level:
		push_error("Could not instantiate new level " + level_scene_uid)
		return
	
	if new_level is not ILevel:
		new_level.free()  # Level must be freed to avoid unreferenced orphan nodes
		push_error("Loaded level is not of type BaseLevel " + level_scene_uid)
		return
	
	_current_level = new_level as ILevel
	
	level_root.add_child(_current_level)

#endregion
