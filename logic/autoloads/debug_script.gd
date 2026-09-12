extends Node

## Description: The purpose of this script is to hold code relating to testing 
## systems and UI, quick and dirty.
## Filename: debug_script.gd
## Author(s): Matthew Perry,
## Last Updated: 09/07/2026

#region export variables (snake_case):
@export var health_system : HealthSystem
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	#ManagerBus.start_button_pressed.connect(_handle_startbutton_action)
	
	health_system.connect("health_updated", _health_has_changed)
	health_system.connect("unit_died", _unit_has_died)
	
func _input(event: InputEvent) -> void:
	if not OS.is_debug_build():
		return
	if event.is_action_pressed(&"damage unit"):
		health_system.damage_health_points(10.0)
	
	if event.is_action_pressed(&"heal unit"):
		health_system.heal_health_points(10.0)
		
#endregion

#region private methods (undersocre prefixed snake_case):
func _handle_startbutton_action() -> void:
	print("Debug: I heard the emitted start button signal!")
	pass
	
func _health_has_changed(current_health : float) -> void:
	print("Debug: health has changed!")
	print("Debug: health points is now " + str(current_health))
	
func _unit_has_died(damage_amount : float) -> void:
	print("Debug: unit died!")
	print("Debug: unit took " + str(damage_amount) + " damage!")

#endregion
