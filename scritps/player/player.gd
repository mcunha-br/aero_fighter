extends Area2D

var speed := 200
var movement := Vector2()
var smooth := 0.0
var weapon := 0
var death := false

onready var animation := $animation_tree
onready var weapons := $weapons


func _ready() -> void:
	GameController.lifes = 2


func _process(delta: float) -> void:
	movement.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	movement.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	position += movement.normalized() * speed * delta
	
	smooth = lerp(smooth, movement.x, 50 * delta)
	animation.set("parameters/blend_position", smooth)


func upgrade_weapon() -> void:
	weapon += 1
	if weapon < weapons.get_child_count():
		for w in weapons.get_children():
			w.hide()
		weapons.get_child(weapon).show()


func apply_damage() -> void:
	if GameController.lifes > 0 and not death:
		GameController.lifes -= 1
		$collision.disabled = true
		for _i in range(12):
			yield(get_tree().create_timer(0.1), "timeout")
			$sprite.visible = not $sprite.visible
		$collision.disabled = false
		$sprite.visible = true

	elif not death:
		death = true
		$collision.disabled = true
		$sprite.visible = false
		set_process(false)
