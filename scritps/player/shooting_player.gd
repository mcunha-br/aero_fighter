extends Area2D

var speed := 300


func _process(delta: float) -> void:
	translate(Vector2.UP * speed * delta)
	
func _on_visibility_screen_exited() -> void:
	queue_free()

func _on_shooting_player_area_entered(area: Area2D) -> void:
	if area.has_method("apply_damage") and area.is_in_group("enemy"):
		area.apply_damage()
		queue_free()
