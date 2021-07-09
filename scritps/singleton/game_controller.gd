extends Node

signal update_score(score)
signal update_life(life)

var score := 0 setget _update_score
var lifes := 0 setget _update_life


func _update_score(_score: int) -> void:
	score = _score
	emit_signal("update_score", score)
	
func _update_life(_life: int) -> void:
	lifes = _life
	emit_signal("update_life", lifes)
