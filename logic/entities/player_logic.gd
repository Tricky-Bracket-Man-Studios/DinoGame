class_name PlayerLogic
extends Node

## Description: The purpose of this script is to hold any logic related to the 
## Player, I will use this to hand off the players dino for now.
## Filename: player_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 09/17/2026

#region export variables (snake_case):
@export var current_dino_object : PackedScene
#endregion

#region public variables (non underscore prefixed snake_case):
var current_dino_object_uid : String = ""
#endregion

#region private variables (undersocre prefixed snake_case):
var _current_dino_logic : DinoLogic = null
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if not is_instance_valid(current_dino_object):
		push_error(name + ": Please assign current dino!")
		return
	
	current_dino_object_uid = CommonUtils.get_uid_from_scene(current_dino_object)
	
	ManagerSignalBus.change_players_dino_stance.connect(_change_players_dino_stance)
	ManagerSignalBus.deliver_unit.connect(_set_players_dino_logic)
#endregion

#region private methods (undersocre prefixed snake_case):
func _set_players_dino_logic(_dino_uid : String, dino_node : Node2D) -> void:
	if current_dino_object_uid != "":
		if current_dino_object_uid == _dino_uid:
			_current_dino_logic = dino_node as DinoLogic 
			_current_dino_logic.dino_visuals.animation_completed.connect(
				_players_animations_completed
			)

func _players_animations_completed() -> void:
	ManagerSignalBus.players_animations_finished.emit.call_deferred()
	

func _change_players_dino_stance(new_stance : DinoLogic.DinoBattleStance) -> void:
	if not is_instance_valid(_current_dino_logic):
		push_error(name + ": could not find dino instance in memory!")
		return

	_current_dino_logic.change_current_stance(new_stance)
#endregion
