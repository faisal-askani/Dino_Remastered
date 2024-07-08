class_name DinoRunningState extends State

@export var _anim: AnimatedSprite2D
@export var _dino: CharacterBody2D
@export var _running_collisions: Array[CollisionShape2D]

signal jump
signal ducking

func _enter_state():
	print("enter running")
	for collision in _running_collisions:
		#collision.set_disabled(false)
		#collision.set_visible(true)
		collision.call_deferred("set_disabled", false)
		collision.call_deferred("set_visible", true)
	set_physics_process(true)
	set_process_input(true)
	_anim.play("running")

func _exit_state():
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

func _physics_process(delta):
	#_dino.velocity.x = 1 * 10
	#_dino.move_and_slide()
	pass
