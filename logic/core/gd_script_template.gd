@tool
@icon("res://path/to/icon.svg")
class_name PascalCase
extends Node

## Filename: main_game.gd
## Description: The purpose of this script is to orcastrate the game from a high level.
## Author(s): Matthew Perry,
## Last Updated: 09/06/2026

#region signals (snake_case):
signal something_happend(value : int)
#endregion

#region enums(PascalCase, members are CONSTANT_CASE):
enum EnumName
{
	ITEM_1,
	ITEM_2
}
#endregion

#region constants (CONSTANT_CASE):
const CONSTANT_VARIABLE : float = 21.67
#endregion

#region export variables (snake_case):
@export var exported_variable : float = 0.0
#endregion

#region public variables (non underscore prefixed snake_case):
var is_a_public_variable : bool = false
#endregion

#region private variables (undersocre prefixed snake_case):
var _this_is_private : bool = true
#endregion

#region onready variables (snake_case)
@onready var on_ready_var : Sprite2D = $Sprite2D
#endregion

#region (optional) build in virtural methods:
# Optional built in virtual methods:
# _init()
# _enter_tree()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
#endregion

#region public methods (non underscore prefixed snake_case):
func do_a_thing(the_thing : String) -> void:
	pass
#endregion

#region private methods (undersocre prefixed snake_case):
func _do_a_thing_but_private() -> float:
	return 420.67
#endregion

#region Callback
func _on_a_thing_happening() -> void:
	pass
#endregion

#region Inner class
class InnerClassName:
	pass
#endregion
