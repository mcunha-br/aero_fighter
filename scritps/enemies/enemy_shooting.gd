extends Area2D

const SPEED := 200

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
	

func _on_visibility_notifier_screen_exited() -> void:
	queue_free()


func _on_enemy_shooting_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.call_deferred("apply_damage")
		queue_free()
