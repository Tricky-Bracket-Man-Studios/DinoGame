class_name DinoLogic
extends Node2D

## Description: The purpose of this script is to hold the logic for each dino
## Filename: dino_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 10/04/2026

#region signals (snake_case):
signal changed_dino_stance(new_stance : DinoBattleStance)
#endregion

#region enums(PascalCase, members are CONSTANT_CASE):
enum DinoBattleStance
{
	NONE,
	ATTACK,
	SPECIAL_ATTACK,
	ULTIMATE_ATTACK,
	DEFEND,
	SPECIAL_DEFEND,
	NULL_DEFEND
}
#endregion

#region export variables (snake_case):
@export var stats : DinoStats
@export var health_system : IHealthSystem
@export var dino_visuals: DinoVisuals
#endregion

#region private variables (undersocre prefixed snake_case):
var _attack : float
var _special_attack : float
var _defense : float
var _special_defense : float
var _level : float
var _current_experince : float
var _current_stance : DinoBattleStance = DinoBattleStance.NONE
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	health_system.set_max_health_points(stats.max_health)
	_attack = stats.attack
	_special_attack = stats.special_attack
	_defense = stats.defense
	_special_defense = stats.special_defense
	_level = stats.level
	_current_experince = stats.current_experience
	_set_current_stance(DinoBattleStance.NONE)
#endregion

#region public methods (non underscore prefixed snake_case):
func change_current_stance(new_stance : DinoBattleStance) -> void:
	_set_current_stance(new_stance)
#endregion

#region private methods (undersocre prefixed snake_case):
func _set_current_stance(new_stance : DinoBattleStance) -> void:
	_current_stance = new_stance
	changed_dino_stance.emit(new_stance)
#endregion
