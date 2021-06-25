extends Area2D

export(int) var energy = 3
export(PackedScene) var explosion


func apply_damage() -> void:
	energy -= 1
	if energy <= 0:
		var explosion_temp = explosion.instance()
		get_tree().root.add_child(explosion_temp)
		explosion_temp.global_position = global_position
		_death()
	else:
		_blink()
		
		
func _death() -> void:
	$timer_blink.stop()
	$sprite.queue_free()
	$destroyed.show()
	$collision.queue_free()			

func _blink() -> void:
	$sprite.modulate = Color.red
	$timer_blink.start()
	
func _on_timer_blink_timeout() -> void:
	$sprite.modulate = Color.white
