extends Node

## Description: The purpose of this script is to hold all relevant signals for managers
## Filename: manager_signal_bus.gd
## Author(s): Matthew Perry,
## Last Updated: 09/13/2026

#region signals (snake_case):

@warning_ignore("unused_signal")
signal return_to_main_menu()

@warning_ignore("unused_signal")
signal load_menu(menu : String)

@warning_ignore("unused_signal")
signal load_level(level : String)

@warning_ignore("unused_signal")
signal load_system(system : String)

@warning_ignore("unused_signal")
signal change_game_state_request()

@warning_ignore("unused_signal")
signal change_battle_state_request()

@warning_ignore("unused_signal")
signal change_players_dino_stance(stance : String)

@warning_ignore("unused_signal")
signal enable_attack_phase_hud_request()

@warning_ignore("unused_signal")
signal enable_defense_phase_hud_request()

@warning_ignore("unused_signal")
signal disable_attack_phase_hud_request()

@warning_ignore("unused_signal")
signal disable_defense_phase_hud_request()

@warning_ignore("unused_signal")
signal calculate_battle_request()

@warning_ignore("unused_signal")
signal calculated_battle_request()
#endregion
