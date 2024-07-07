class_name DinoDuckingState extends State

@export var _anim: AnimatedSprite2D
@export var _dino: CharacterBody2D
@export var _ducking_collisions: Array[CollisionShape2D]

signal running

func _enter_state():
	print("enter ducking")
	for collision in _ducking_collisions:
		#collision.set_disabled(false)
		#collision.set_visible(true)
		collision.call_deferred("set_disabled", false)
		collision.call_deferred("set_visible", true)
	set_physics_process(true)
	set_process_input(true)
	_anim.play("ducking")

func _exit_state():
	print("exit ducking")
	for collision in _ducking_collisions:
		#collision.set_disabled(true)
		#collision.set_visible(false)
		collision.call_deferred("set_disabled", true)
		collision.call_deferred("set_visible", false)
	set_physics_process(false)
	set_process_input(false)

func _input(event):
	if event.is_action_released("ducking"):
		print("Input released: ducking")
		running.emit()

func _ready():
	set_physics_process(false)
	set_process_input(false)

func _physics_process(delta):
	pass
