extends Position2D

const SHOOT := preload("res://prefabs/player/shooting_player.tscn")

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_shoot") and get_parent().visible:
		shooting()
		
func shooting() -> void:
	var shoot = SHOOT.instance()
	get_tree().root.add_child(shoot)
	shoot.global_position = global_position
