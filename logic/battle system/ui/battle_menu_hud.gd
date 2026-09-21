extends Control

## Description: The purpose of this script is to hold the logic for the battle menu.
## Filename: battle_menu_hud.gd
## Author(s): Matthew Perry,
## Last Updated: 09/16/2026

#region export variables (snake_case):
@export_category("Buttons")
@export var attack_card : Button
@export var special_attack_card : Button
@export var ultimate_attack_card : Button

@export var defense_card : Button
@export var special_defense_card : Button
@export var null_defense_card : Button

@export  var retry_button : Button
@export var retry_battle_select_button : Button
@export var retry_main_menu_button : Button
@export var next_battle_button : Button
@export var victory_main_menu_button : Button
@export var victory_battle_select_button : Button

@export_category("Containers")
@export var attack_phase_hud : BoxContainer
@export var defense_phase_hud : BoxContainer
@export var retry_menu : Control
@export var victory_menu : Control
#endregion

#region private variables (undersocre prefixed snake_case):
var _cards_are_valid : bool = true
#endregion

#region (optional) build in virtural methods:
func _ready() -> void:
	ManagerSignalBus.enable_attack_phase_hud_request.connect(_enable_attack_phase_hud)
	ManagerSignalBus.enable_defense_phase_hud_request.connect(_enable_defense_phase_hud)
	ManagerSignalBus.enable_retry_menu.connect(_enable_retry_menu)
	ManagerSignalBus.enable_victory_menu.connect(_enable_victory_menu)
	
	
	ManagerSignalBus.disable_attack_phase_hud_request.connect(_disable_attack_phase_hud)
	ManagerSignalBus.disable_defense_phase_hud_request.connect(_disable_defense_phase_hud)
	ManagerSignalBus.disable_retry_menu.connect(_disable_retry_menu)
	ManagerSignalBus.disable_victory_menu.connect(_disable_retry_menu)
	
	_validate_cards()
	
	if _cards_are_valid:
		attack_card.pressed.connect(_on_attack_card_chosen)
		special_attack_card.pressed.connect(_on_special_attack_card_chosen)
		ultimate_attack_card.pressed.connect(_on_ultimate_attack_card_chosen)
		
		defense_card.pressed.connect(_on_defense_card_chosen)
		special_defense_card.pressed.connect(_on_special_defense_card_chosen)
		null_defense_card.pressed.connect(_on_null_card_chosen)
		
		retry_button.pressed.connect(_on_retry_pressed)
		retry_battle_select_button.pressed.connect(_on_battle_select_pressed)
		retry_main_menu_button.pressed.connect(_on_main_menu_pressed)
		next_battle_button.pressed.connect(_on_next_battle_pressed)
		victory_battle_select_button.pressed.connect(_on_battle_select_pressed)
		victory_main_menu_button.pressed.connect(_on_main_menu_pressed)

#endregion

#region private methods (undersocre prefixed snake_case):
func _on_attack_card_chosen() -> void:
	print(name + ": chose the attack card!")
	ManagerSignalBus.change_players_dino_stance.emit(IDino.DinoBattleStance.ATTACK)
	ManagerSignalBus.change_battle_state_request.emit()

func _on_special_attack_card_chosen() -> void:
	print(name + ": chose the special card!")
	ManagerSignalBus.change_players_dino_stance.emit(IDino.DinoBattleStance.SPECIAL_ATTACK)
	ManagerSignalBus.change_battle_state_request.emit()

func _on_ultimate_attack_card_chosen() -> void:
	print(name + ": chose the ultimate card!")
	ManagerSignalBus.change_players_dino_stance.emit(IDino.DinoBattleStance.ULTIMATE_ATTACK)
	ManagerSignalBus.change_battle_state_request.emit()
	
func _on_defense_card_chosen() -> void:
	print(name + ": chose the defense card!")
	ManagerSignalBus.change_players_dino_stance.emit(IDino.DinoBattleStance.DEFEND)
	ManagerSignalBus.change_battle_state_request.emit()
	
func _on_special_defense_card_chosen() -> void:
	print(name + ": chose the Special Defense card!")
	ManagerSignalBus.change_players_dino_stance.emit(IDino.DinoBattleStance.SPECIAL_DEFEND)
	ManagerSignalBus.change_battle_state_request.emit()
	
func _on_null_card_chosen() -> void:
	print(name + ": chose the ultimate card!")
	ManagerSignalBus.change_players_dino_stance.emit(IDino.DinoBattleStance.NULL_DEFEND)
	ManagerSignalBus.change_battle_state_request.emit()

func _on_next_battle_pressed() -> void:
	pass

func _on_battle_select_pressed() -> void:
	ManagerSignalBus.change_game_state_battle_select.emit()

func _on_main_menu_pressed() -> void:
	ManagerSignalBus.return_to_main_menu.emit()

func _on_retry_pressed() -> void:
	ManagerSignalBus.change_game_state_request.emit()

func _validate_cards() -> void:
	var cards : Array[Button] = [
			attack_card, special_attack_card, ultimate_attack_card, 
			defense_card, special_defense_card, null_defense_card,
			retry_button, retry_battle_select_button, retry_main_menu_button,
			next_battle_button, victory_battle_select_button, victory_main_menu_button
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

func _enable_retry_menu() -> void:
	retry_menu.show()

func _disable_retry_menu() -> void:
	retry_menu.hide()

func _enable_victory_menu() -> void:
	victory_menu.show()
		
func _disable_victory_menu() -> void:
	victory_menu.hide()
#endregion
