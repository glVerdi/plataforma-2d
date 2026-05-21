extends Node

var player_health: int = 3
var max_health: int = 3

signal health_changed

func reset_game():
	player_health = max_health
	health_changed.emit()
