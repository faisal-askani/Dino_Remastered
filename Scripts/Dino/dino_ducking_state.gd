class_name DinoDuckingState extends State

@export var _anim: AnimatedSprite2D
@export var _dino: CharacterBody2D
@export var _ducking_collisions: Array[CollisionShape2D]

@onready var timer = Timer.new()

var frame: int

signal running

func _enter_state():
	print("enter ducking")
	timer.wait_time = 1.0 / GameManager.game_speed
	timer.start()
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
	timer.stop()
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
	timer.wait_time = 0
	timer.connect("timeout", _ducking_animation_speed)
	add_child(timer)

func _physics_process(delta):
	pass

func _ducking_animation_speed():
	timer.stop()
	
	if frame >= _anim.sprite_frames.get_frame_count(_anim.animation):
		frame = 0
	
	if frame >= 0 && frame < _anim.sprite_frames.get_frame_count(_anim.animation):
		_anim.frame = frame
	
	frame += 1
	
	timer.wait_time = 1.0 / GameManager.game_speed
	timer.start()
