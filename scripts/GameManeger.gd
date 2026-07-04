extends Node

var player_health: int = 3
var max_health: int = 3

var has_double_jump: bool = false
var has_wall_jump: bool = false

signal health_changed

func reset_game():
	player_health = max_health
	health_changed.emit()
	
	var cena_atual = get_tree().current_scene.scene_file_path.to_lower()
	
	if "forest" in cena_atual:
		has_wall_jump = false
	else:
		has_double_jump = false
		has_wall_jump = false
