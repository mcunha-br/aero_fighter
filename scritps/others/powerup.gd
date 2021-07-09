extends Area2D

var speed := 50
var min_clamped := 5
var max_clamped := 355
var direction := Vector2()


func _ready() -> void:
	direction = Vector2(random_direction(), random_direction())


func _process(delta: float) -> void:
	translate(direction * speed * delta)
	if position.x <= min_clamped || position.x >= max_clamped:
		direction.x *= -1
	elif position.y <= min_clamped || position.y >= max_clamped:
		direction.y *= -1


func _on_powerup_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.upgrade_weapon()
		queue_free()

func random_direction() -> int:
	randomize()
	var direction_rand := [-1, 1]
	return direction_rand[rand_range(0, direction_rand.size())]
