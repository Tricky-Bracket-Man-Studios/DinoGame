extends Node

## Description: The purpose of this script is to hold code relating to testing 
## systems and UI, quick and dirty.
## Filename: debug_script.gd
## Author(s): Matthew Perry,
## Last Updated: 09/12/2026

#region export variables (snake_case):
@export var health_system : IHealthSystem
@export var dino_game : Node
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if not OS.is_debug_build():
		return
	
	if health_system == null:
		push_error(name + ": HealthSystem is null, make sure to assign it!")
		return
	
	health_system.health_updated.connect(_health_has_changed)
	health_system.unit_died.connect(_unit_has_died)
	
func _input(event: InputEvent) -> void:
	if not OS.is_debug_build():
		return
	
	if is_instance_valid(health_system):
		if event.is_action_pressed(&"damage unit"):
			health_system.damage_health_points(10.0)
	
		if event.is_action_pressed(&"heal unit"):
			health_system.heal_health_points(10.0)
	
	if is_instance_valid(dino_game):
		if event.is_action_pressed(&"debug_quit"):
			dino_game.quit_game()
	
	
	
	
#endregion

#region private methods (undersocre prefixed snake_case):
	
func _health_has_changed(current_health : float) -> void:
	print("Debug: health has changed!")
	print("Debug: health points is now " + str(current_health))
	
func _unit_has_died(damage_amount : float) -> void:
	print("Debug: unit died!")
	print("Debug: unit took " + str(damage_amount) + " damage!")

#endregion
