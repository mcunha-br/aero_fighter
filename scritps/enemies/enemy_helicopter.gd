extends Area2D

export(int) var energy = 3
export(PackedScene) var explosion

var score := 0


func _ready() -> void:
	score = energy * 50


func apply_damage() -> void:
	energy -= 1
	if energy <= 0:
		GameController.score += score
		var explosion_temp = explosion.instance()
		get_tree().root.add_child(explosion_temp)
		explosion_temp.global_position = global_position
		queue_free()
	else:
		_blink()
		
		
func _blink() -> void:
	$sprite.modulate = Color.red
	$timer_blink.start()


func _on_timer_blink_timeout() -> void:
	$sprite.modulate = Color.white
