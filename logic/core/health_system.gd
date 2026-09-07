@abstract
class_name HealthSystem
extends Node2D

## Description: The purpose of this script is to hold the logic for the Health System. all things 
## related to damage and health points should be handled by this script.
## Filename: health_system.gd
## Author(s): Matthew Perry,
## Last Updated: 09/07/2026

#region export variables (snake_case):
@export var max_health_points : float = 100
@export var current_health_points : float
#endregion
