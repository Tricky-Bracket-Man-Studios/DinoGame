class_name dino_trexe_logic
extends IDino

## Description: The purpose of this script is to hold the logic for each trex
## Filename: dino_trex_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 09/14/2026

#region (optional) build in virtural methods:
func _ready() -> void:
	_attack = stats.attack
	_special_attack = stats.special_attack
	_defense = stats.defense
	_special_defense = stats.special_defense
	_level = stats.level
	_current_experince = stats.current_experience
	sprite.texture = stats.texture
#endregion
