extends Node2D

var target

func _ready() -> void:
	target = get_tree().get_nodes_in_group("player") 


func _process(delta: float) -> void:
	if target:
		look_at(target[0].global_position)
