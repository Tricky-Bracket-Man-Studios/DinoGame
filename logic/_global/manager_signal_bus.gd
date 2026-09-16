extends Node

## Description: The purpose of this script is to hold all relevant signals for managers
## Filename: manager_signal_bus.gd
## Author(s): Matthew Perry,
## Last Updated: 09/15/2026

#region signals (snake_case):

@warning_ignore("unused_signal")
signal return_to_main_menu()

@warning_ignore("unused_signal")
signal reload_menu()

@warning_ignore("unused_signal")
signal load_menu(menu : String)

@warning_ignore("unused_signal")
signal load_level(level : String)

@warning_ignore("unused_signal")
signal load_system(system : String)

@warning_ignore("unused_signal")
signal load_units(unit : Array[String], spawn_location : Vector2)

@warning_ignore("unused_signal")
signal unload_units()

@warning_ignore("unused_signal")
signal change_game_state_request()

@warning_ignore("unused_signal")
signal change_battle_state_request()

@warning_ignore("unused_signal")
signal change_players_dino_stance(stance : IDino.DinoBattleStance)

@warning_ignore("unused_signal")
signal enable_attack_phase_hud_request()

@warning_ignore("unused_signal")
signal enable_defense_phase_hud_request()

@warning_ignore("unused_signal")
signal enable_retry_menu()

@warning_ignore("unused_signal")
signal disable_attack_phase_hud_request()

@warning_ignore("unused_signal")
signal disable_defense_phase_hud_request()

@warning_ignore("unused_signal")
signal disable_retry_menu()

@warning_ignore("unused_signal")
signal calculate_battle_request()

@warning_ignore("unused_signal")
signal calculated_battle_request()

@warning_ignore("unused_signal")
signal spawned_enemy_dino(dino_uid : String)

@warning_ignore("unused_signal")
signal spawned_player_dino(dino_uid : String)

@warning_ignore("unused_signal")
signal get_unit_request(dino_uid : String)

@warning_ignore("unused_signal")
signal deliver_unit(dino_uid : String, dino_unit : Node2D)

@warning_ignore("unused_signal")
signal trigger_battle_loss_phase()

@warning_ignore("unused_signal")
signal trigger_battle_won_phase()
#endregion
