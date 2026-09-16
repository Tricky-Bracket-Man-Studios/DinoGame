class_name DinoStats
extends Resource

## Description: The purpose of this script is to hold the stats of dinos
## Filename: dino_stats.gd
## Author(s): Matthew Perry,
## Last Updated: 09/14/2026

#region export variables (snake_case):
@export var max_health : float = 100
@export var current_health : float = 100
@export var attack : float = 10
@export var special_attack : float = 10
@export var defense : float = 5
@export var special_defense : float = 5
@export var level : float = 1
@export var current_experience : float = 0
@export var texture : Texture2D
#endregion
