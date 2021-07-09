extends Control

const ICON_LIFE := preload("res://prefabs/others/icon_f18.tscn")

func _ready() -> void:
	GameController.connect("update_score", self, "_update_score")
	GameController.connect("update_life", self, "_update_life")
	
	
func _update_score(score: int) -> void:
	$player_one/txt_score.text = str(score)

func _update_life(life: int) -> void:
	for icon in $player_one/container.get_children():
		icon.queue_free()
	for _i in range(life):
		var icon = ICON_LIFE.instance()
		$player_one/container.add_child(icon)
	
