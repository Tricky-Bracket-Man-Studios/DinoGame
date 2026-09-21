class_name dino_logic
extends IDino

## Description: The purpose of this script is to hold the logic for each trex
## Filename: dino_logic.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

@onready var animated_sprite = $AnimatedSprite2D

#region (optional) build in virtural methods:
func _ready() -> void:
	ManagerSignalBus.change_players_dino_stance.connect(_change_current_stance)
	health_system.set_max_health_points(stats.max_health)
	_attack = stats.attack
	_special_attack = stats.special_attack
	_defense = stats.defense
	_special_defense = stats.special_defense
	_level = stats.level
	_current_experince = stats.current_experience

#endregion

#region private methods (undersocre prefixed snake_case):

func _change_current_stance(new_stance : DinoBattleStance) -> void:
	_current_stance = new_stance
	
	##if IDino.DinoBattleStance = (ATTACK, SPECIAL_ATTACK, ULTIMATE_ATTACK):
	##	animated_sprite.play("attack")
	##else:
	##	animated_sprite.play("idle")
		
#endregion
