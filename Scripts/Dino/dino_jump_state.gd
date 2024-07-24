class_name DinoJumpState extends State

@export var _anim: AnimatedSprite2D
@export var _dino: CharacterBody2D
@export var _jump_collisions: Array[CollisionShape2D]

@onready var _sound_play = sound_player.get_node("JumpAudioStream")

const JUMP_VELOCITY = -550.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var _gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal running

func _enter_state():
	print("enter jump")
	for collision in _jump_collisions:
		#collision.set_disabled(false)
		#collision.set_visible(true)
		collision.call_deferred("set_disabled", false)
		collision.call_deferred("set_visible", true)
	set_physics_process(true)
	_dino.velocity.y = JUMP_VELOCITY
	_anim.play("jump")
	_sound_play.play()
	_dino.move_and_slide()

func _exit_state():
	print("exit jump")
	for collision in _jump_collisions:
		#collision.set_disabled(true)
		#collision.set_visible(false)
		collision.call_deferred("set_disabled", true)
		collision.call_deferred("set_visible", false)
	set_physics_process(false)

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	if _dino.is_on_floor():
		running.emit()
	if _dino.velocity.y > 0:
		_anim.play("fall")
	_dino.velocity.y += _gravity * delta
	_dino.move_and_slide()
