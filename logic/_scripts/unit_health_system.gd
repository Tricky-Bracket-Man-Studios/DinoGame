extends IHealthSystem

## Description: The purpose of this script is to hold the logic for A units Health System. all things 
## related to damage and health points should be handled by this script.
## Filename: unit_health_system.gd
## Author(s): Matthew Perry,
## Last Updated: 09/11/2026

#region export variables (snake_case):
@export var max_health_points : float = 100
@export var current_health_points : float
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	current_health_points = max_health_points
#endregion

#region public methods (non underscore prefixed snake_case):
func heal_health_points(healamount : float) -> void:
	current_health_points += healamount
	current_health_points =  clampf(current_health_points, 0, max_health_points)
	
	health_updated.emit(current_health_points)

func damage_health_points(damage_amount : float) -> void:
	if current_health_points <= 0:
		return
	
	current_health_points -= damage_amount
	current_health_points = clampf(current_health_points, 0, max_health_points)
	
	health_updated.emit(current_health_points)
	
	if current_health_points <= 0:
		unit_died.emit(damage_amount)

func get_current_health_points() -> float :
	return current_health_points
	
func get_max_health_points() -> float :
	return max_health_points
#endregion
