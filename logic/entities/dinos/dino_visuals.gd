class_name DinoVisuals
extends AnimatedSprite2D

## Description: The purpose of this script is to hold the logic for each dino's
## visual in game.
## Filename: dino_visual.gd
## Author(s): Matthew Perry,
## Last Updated: 10/04/2026

#region signals (snake_case):
signal animation_completed()
#endregion

#region export variables (snake_case):
@export var dino_logic : DinoLogic
@export var is_animation_complete : bool
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	if not is_instance_valid(dino_logic):
		push_error(name + ": Please assign Dino Logic to the Visual script!")
		return
		
	dino_logic.changed_dino_stance.connect(_animate_stance)
#endregion

#region private methods (undersocre prefixed snake_case):
func _animate_stance(stance : DinoLogic.DinoBattleStance) -> void:
	is_animation_complete = false
	match stance:
		DinoLogic.DinoBattleStance.ATTACK:
			self.play("attack")
			await self.animation_finished
			self.play("idle")
		DinoLogic.DinoBattleStance.SPECIAL_ATTACK:
			self.play("attack")
			await self.animation_finished
			self.play("idle")
		DinoLogic.DinoBattleStance.ULTIMATE_ATTACK:
			self.play("attack")
			await self.animation_finished
			self.play("idle")
		DinoLogic.DinoBattleStance.DEFEND:
			self.play("idle")
		_:
			self.play("idle")
	
	animation_completed.emit()
	is_animation_complete = true
	
#endregion
