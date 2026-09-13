@abstract
class_name IHealthSystem
extends Node2D

## Description: The purpose of this script is to clarify what to expect from all Health Systems. 
## Filename: health_system_interface.gd
## Author(s): Matthew Perry,
## Last Updated: 09/07/2026

#region signals (snake_case):
@warning_ignore("unused_signal")
signal unit_died(damage_amount : float)

@warning_ignore("unused_signal")
signal health_updated(current_health : float)
#endregion

#region public methods (non underscore prefixed snake_case):

@abstract func heal_health_points(heal_amount : float)
@abstract func damage_health_points(damage_amount : float)

@abstract func get_current_health_points() -> float
@abstract func get_max_health_points() -> float
#endregion
