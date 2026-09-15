@abstract 
class_name IDino
extends Node2D

## Description: The purpose of this script is to express how dinos interact with
## managers.
## Filename: dino_interface.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

#region export variables (snake_case):
@export var stats : DinoStats
@export var health_system : IHealthSystem
@export var sprite : Sprite2D
#endregion

#region private variables (undersocre prefixed snake_case):
@warning_ignore("unused_variable")
var _attack : float
@warning_ignore("unused_variable")
var _special_attack : float
@warning_ignore("unused_variable")
var _defense : float
@warning_ignore("unused_variable")
var _special_defense : float
@warning_ignore("unused_variable")
var _level : float
@warning_ignore("unused_variable")
var _current_experince : float
#endregion
