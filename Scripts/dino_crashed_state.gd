class_name DinoCrashedState extends State

@export var _anim: AnimatedSprite2D

func _enter_state():
	print("enter crashed")
	set_physics_process(true)
	set_process_input(true)
	_anim.play("crashed")

func _exit_state():
	print("exit crashed")
	set_physics_process(false)
	set_process_input(false)

func _ready():
	set_physics_process(false)
	set_process_input(false)

func _physics_process(delta):
	pass
