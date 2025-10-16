class_name Player
extends CharacterBody2D

@export var speed: float = 180
@onready var sprite : AnimatedSprite2D = %AnimatedSprite2D
enum ControlScheme{CPU,P1,P2}
@export var control_scheme : ControlScheme
@export var heading:Vector2 = Vector2.RIGHT

func _physics_process(_delta: float) -> void:
	if control_scheme == ControlScheme.CPU:
		return
	else:
		handle_human_movement()
		set_movement_animation()
		set_heading()
		flip_sprite()
		move_and_slide()

"""根据 velocity 控制动画"""
func set_movement_animation():
	if velocity == Vector2.ZERO:
		sprite.play("Idle")
	else:
		sprite.play("Run")

"""获取方向并设置 velocity"""
func handle_human_movement():
	var direction = KeyUtil.get_input_vector(control_scheme)
	velocity = direction * speed

"""根据velocity 改变 heading 中的值"""
func set_heading():
	if velocity.x > 0 :
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT

"""根据 heading 翻转精灵图"""
func flip_sprite():
	sprite.flip_h = false if heading == Vector2.RIGHT else true
