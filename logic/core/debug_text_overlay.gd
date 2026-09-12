class_name DebugTextOverlay
extends Control

## Description: The purpose of this script is to hold all Debug Text UI
## Filename: debug_text_overlay.gd
## Author(s): Matthew Perry,
## Last Updated: 09/07/2026

#region constants (CONSTANT_CASE):
const VERSION_SETTING : String = "application/config/version"
#endregion

#region onready variables (snake_case)
@onready var fps_label : Label = %FpsLabel
@onready var version_info : Label = %VersionInfo
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	_update_version_info_label()
	
func _process(_delta: float) -> void:
	fps_label.set_text("FPS: " + str(Engine.get_frames_per_second()))
	
func _update_version_info_label() -> void:
		var version_str : String = ProjectSettings.get_setting(VERSION_SETTING)
		version_info.text += version_str
#endregion
