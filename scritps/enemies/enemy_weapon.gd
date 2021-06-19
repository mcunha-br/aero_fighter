extends Node2D

const SHOOT := preload("res://prefabs/others/enemy_shooting.tscn")

func _on_timeout() -> void:
	var shoot = SHOOT.instance()
	shoot.transform = global_transform
	shoot.global_position = global_position
	get_tree().root.add_child(shoot)
	
