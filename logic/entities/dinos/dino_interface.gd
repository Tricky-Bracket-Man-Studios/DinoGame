@abstract 
class_name IDino
extends Node2D

## Description: The purpose of this script is to express how dinos interact with
## managers.
## Filename: dino_interface.gd
## Author(s): Matthew Perry,
## Last Updated: 09/14/2026

#region export variables (snake_case):
@export var stats : DinoStats
@export var health_system : IHealthSystem
@export var sprite : Sprite2D
#endregion

#region private variables (undersocre prefixed snake_case):
var _attack : float
var _special_attack : float
var _defense : float
var _special_defense : float
var _level : float
var _current_experince : float
#endregion
