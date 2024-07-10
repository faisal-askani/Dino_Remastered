class_name DinoRunningState extends State

@export var _anim: AnimatedSprite2D
@export var _dino: CharacterBody2D
@export var _running_collisions: Array[CollisionShape2D]

@onready var timer = Timer.new()

signal jump
signal ducking

var _game_manager: GameManager: 
	set(new_value):
		_game_manager = new_value
	
func _enter_state():
	print("enter running")
	timer.start()
	for collision in _running_collisions:
		#collision.set_disabled(false)
		#collision.set_visible(true)
		collision.call_deferred("set_disabled", false)
		collision.call_deferred("set_visible", true)
	set_physics_process(true)
	set_process_input(true)
	_anim.play("running")

func _exit_state():
	timer.stop()
	print("exit running")
	for collision in _running_collisions:
		#collision.set_disabled(true)
		#collision.set_visible(false)
		collision.call_deferred("set_disabled", true)
		collision.call_deferred("set_visible", false)
	set_physics_process(false)
	set_process_input(false)

func _input(event):
	if event.is_action_pressed("jump"):
		print("Input running: jump")
		jump.emit()
	if event.is_action_pressed("ducking"):
		print("Input running: ducking")
		ducking.emit()

func _ready():
	set_physics_process(false)
	set_process_input(false)
	timer.wait_time = 0
	timer.connect("timeout", _animation_speed)
	add_child(timer)

func _physics_process(delta):
	#_dino.velocity.x = 1 * 10
	#_dino.move_and_slide()
	pass

var frame:int
func _animation_speed():
	timer.stop()
	
	if frame >= _anim.sprite_frames.get_frame_count(_anim.animation):
		frame = 0
	print("frame is: ", frame)
	
	if frame >= 0 && frame < _anim.sprite_frames.get_frame_count(_anim.animation):
		_anim.frame = frame
		print("animation frame is: ", _anim.frame)
	
	frame += 1
	
	timer.wait_time = 1.0 / _game_manager.game_speed
	timer.start()

#	var current_frame = _anim.get_frame()
	#var current_progress = _anim.get_frame_progress()
	#_anim.play("idle_blink")
	#_anim.set_frame_and_progress(current_frame, current_progress)
