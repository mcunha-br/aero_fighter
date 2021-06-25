extends Area2D

var speed := 200
var movement := Vector2()
var smooth := 0.0
var weapon := 0

onready var animation := $animation_tree
onready var weapons := $weapons


func _process(delta: float) -> void:
	movement.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movement.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	position += movement.normalized() * speed * delta
	
	smooth = lerp(smooth, movement.x, 30 * delta)
	animation.set("parameters/blend_position", movement.x)


func upgrade_weapon() -> void:
	weapon += 1
	if weapon < weapons.get_child_count():
		for w in weapons.get_children():
			w.hide()
		weapons.get_child(weapon).show()