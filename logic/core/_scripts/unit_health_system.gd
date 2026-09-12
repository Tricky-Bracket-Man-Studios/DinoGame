extends HealthSystem

## Description: The purpose of this script is to hold the logic for A units Health System. all things 
## related to damage and health points should be handled by this script.
## Filename: unit_health_system.gd
## Author(s): Matthew Perry,
## Last Updated: 09/07/2026

#region signals (snake_case):
signal unit_died(damage_amount : float)
signal health_updated(current_health : float)
#endregion

#region export variables (snake_case):
@export var _max_health_points : float = 100
@export var _current_health_points : float
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	_current_health_points = _max_health_points
#endregion

#region public methods (non underscore prefixed snake_case):
func heal_health_points(healamount : float) -> void:
	if _current_health_points >= _max_health_points:
		return
	else:
		_current_health_points += healamount
		if _current_health_points > _max_health_points:
			_current_health_points = _max_health_points
	
	health_updated.emit(_current_health_points)

func damage_health_points(damage_amount : float) -> void:
	if _current_health_points <= 0:
		return
	
	_current_health_points -= damage_amount
	
	if _current_health_points <= 0:
		_current_health_points = 0
		unit_died.emit(damage_amount)
		return
		
	health_updated.emit(_current_health_points)

func get_current_health_points() -> float :
	var current_health_points : float = _current_health_points
	
	return current_health_points
	
func get_max_health_points() -> float :
	var max_health_points : float = _max_health_points
	
	return max_health_points
#endregion
