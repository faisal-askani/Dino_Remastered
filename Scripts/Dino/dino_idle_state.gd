class_name DinoIdleState extends State

@export var _anim: AnimatedSprite2D

const BLINK_TIMING = 7000

var _anim_start_time = 0
var _blink_delay = 0
var _blink_count = 0

signal jump

func _enter_state():
	print("enter idle")
	set_physics_process(true)
	set_process_input(true)
	_anim.play("idle")
	set_blink_delay()
	_anim_start_time = Time.get_ticks_msec()

func _exit_state():
	print("exit idle")
	set_physics_process(false)
	set_process_input(false)

func _input(event):
	if event.is_action_pressed("jump"):
		print("Input idle: jump")
		jump.emit()

func _physics_process(delta):
	#print("idle")
	if is_blink_time():
		blink()

func set_blink_delay():
	var r = randf_range(0.05, 1)
	_blink_delay = ceil(r * BLINK_TIMING)

func is_blink_time() -> bool:
	var current_time = Time.get_ticks_msec()
	var elapsed_time = current_time - _anim_start_time
	return elapsed_time >= _blink_delay

func blink():
	var current_frame = _anim.get_frame()
	var current_progress = _anim.get_frame_progress()
	_anim.play("idle_blink")
	_anim.set_frame_and_progress(current_frame, current_progress)
	await stop_and_resume_process()
	_anim.play("idle")
	set_blink_delay()
	_anim_start_time = Time.get_ticks_msec()
	_blink_count += 1

func stop_and_resume_process():
	set_process(false)
	await _anim.animation_finished
	set_process(true)
