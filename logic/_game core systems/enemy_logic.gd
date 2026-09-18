class_name EnemyLogic
extends Node

## Description: The purpose of this script is to hold any logic related to the 
## Enemy, I will use this to hand off the players dino for now.
## Filename: enemy_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region export variables (snake_case):

@export var battle_1_dino : PackedScene

#endregion

#region public variables (non underscore prefixed snake_case):

var current_dino : PackedScene
var current_dino_uid : String = ""

#endregion

#region (optional) build in virtural methods:

func _ready() -> void:
	if not is_instance_valid(battle_1_dino):
		push_error(name + ": Please assign current dino!")
		return
		
	current_dino = battle_1_dino
	current_dino_uid = CommonUtils.get_uid_from_scene(current_dino)
	
#endregion
