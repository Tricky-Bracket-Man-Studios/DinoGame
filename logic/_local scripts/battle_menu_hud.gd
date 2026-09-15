extends Control

## Description: The purpose of this script is to hold the logic for the battle menu.
## Filename: battle_menu_hud.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region export variables (snake_case):
@export var attack_card : Button
@export var special_attack_card : Button
@export var ultimate_attack_card : Button

@export var defense_card : Button
@export var special_defense_card : Button
@export var null_defense_card : Button

@export var attack_phase_hud : BoxContainer
@export var defense_phase_hud : BoxContainer
#endregion

#region private variables (undersocre prefixed snake_case):
var _cards_are_valid : bool = true
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	ManagerSignalBus.enable_attack_phase_hud_request.connect(_enable_attack_phase_hud)
	ManagerSignalBus.enable_defense_phase_hud_request.connect(_enable_defense_phase_hud)
	ManagerSignalBus.disable_attack_phase_hud_request.connect(_disable_attack_phase_hud)
	ManagerSignalBus.disable_defense_phase_hud_request.connect(_disable_defense_phase_hud)
	
	_validate_cards()
	
	if _cards_are_valid:
		attack_card.pressed.connect(_on_attack_card_chosen)
		special_attack_card.pressed.connect(_on_special_attack_card_chosen)
		ultimate_attack_card.pressed.connect(_on_ultimate_attack_card_chosen)
		
		defense_card.pressed.connect(_on_defense_card_chosen)
		special_defense_card.pressed.connect(_on_special_defense_card_chosen)
		null_defense_card.pressed.connect(_on_null_card_chosen)
		


#region private methods (undersocre prefixed snake_case):
func _on_attack_card_chosen() -> void:
	print(name + ": chose the attack card!")
	ManagerSignalBus.change_players_dino_stance.emit("AttackStance")
	ManagerSignalBus.change_battle_state_request.emit()

func _on_special_attack_card_chosen() -> void:
	print(name + ": chose the special card!")
	ManagerSignalBus.change_players_dino_stance.emit("SpecialAttackStance")
	ManagerSignalBus.change_battle_state_request.emit()

func _on_ultimate_attack_card_chosen() -> void:
	print(name + ": chose the ultimate card!")
	ManagerSignalBus.change_players_dino_stance.emit("UltimateAttackStance")
	ManagerSignalBus.change_battle_state_request.emit()
	
func _on_defense_card_chosen() -> void:
	print(name + ": chose the defense card!")
	ManagerSignalBus.change_players_dino_stance.emit("DefenseStance")
	ManagerSignalBus.change_battle_state_request.emit()
	
func _on_special_defense_card_chosen() -> void:
	print(name + ": chose the Special Defense card!")
	ManagerSignalBus.change_players_dino_stance.emit("SpecialDefenseStance")
	ManagerSignalBus.change_battle_state_request.emit()
	
func _on_null_card_chosen() -> void:
	print(name + ": chose the ultimate card!")
	ManagerSignalBus.change_players_dino_stance.emit("NullStance")
	ManagerSignalBus.change_battle_state_request.emit()

func _validate_cards() -> void:
	var cards : Array[Button] = [
			attack_card, special_attack_card, ultimate_attack_card, 
			defense_card, special_defense_card, null_defense_card
	]
	for card in cards:
		if not is_instance_valid(card):
			push_error(name + ": a card is not assigned")
			_cards_are_valid = false
			
func _enable_attack_phase_hud() -> void:
	attack_phase_hud.show()
	
func _disable_attack_phase_hud() -> void:
	attack_phase_hud.hide()
	
func _enable_defense_phase_hud() -> void:
	defense_phase_hud.show()
	
func _disable_defense_phase_hud() -> void:
	defense_phase_hud.hide()
#endregion
