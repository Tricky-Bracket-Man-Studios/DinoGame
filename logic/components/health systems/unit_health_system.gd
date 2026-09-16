extends IHealthSystem

## Description: The purpose of this script is to hold the logic for A units Health System. all things 
## related to damage and health points should be handled by this script.
## Filename: unit_health_system.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

#region private variables (undersocre prefixed snake_case):
var _max_health_points : float = 100
var _current_health_points : float = 0
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	_current_health_points = _max_health_points
#endregion

#region public methods (non underscore prefixed snake_case):
func heal_health_points(healamount : float) -> void:
	if _current_health_points >= _max_health_points:
		_current_health_points =  clampf(_current_health_points, 0, _max_health_points)
		return
		
	_current_health_points += healamount
	_current_health_points =  clampf(_current_health_points, 0, _max_health_points)
	
	health_updated.emit(_current_health_points)

func damage_health_points(damage_amount : float) -> void:
	if _current_health_points <= 0:
		_current_health_points =  clampf(_current_health_points, 0, _max_health_points)
		return
	
	_current_health_points -= damage_amount
	_current_health_points = clampf(_current_health_points, 0, _max_health_points)
	
	health_updated.emit(_current_health_points)
	
	if _current_health_points <= 0:
		unit_died.emit(damage_amount)

func get_current_health_points() -> float :
	return _current_health_points
	
func get_max_health_points() -> float :
	return _max_health_points
#endregion
