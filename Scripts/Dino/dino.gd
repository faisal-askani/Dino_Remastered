class_name Dino extends CharacterBody2D

@export var _game_manager: GameManager

@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var dino_idle_state = $FiniteStateMachine/DinoIdleState as DinoIdleState
@onready var dino_running_state = $FiniteStateMachine/DinoRunningState as DinoRunningState
@onready var dino_jump_state = $FiniteStateMachine/DinoJumpState as DinoJumpState
@onready var dino_ducking_state = $FiniteStateMachine/DinoDuckingState as DinoDuckingState
@onready var dino_crashed_state = $FiniteStateMachine/DinoCrashedState as DinoCrashedState

func _ready():
	dino_running_state._game_manager = _game_manager
	
	dino_idle_state.jump.connect(fsm.change_State.bind(dino_jump_state))
	dino_running_state.jump.connect(fsm.change_State.bind(dino_jump_state))
	dino_running_state.ducking.connect(fsm.change_State.bind(dino_ducking_state))
	dino_ducking_state.running.connect(fsm.change_State.bind(dino_running_state))
	dino_jump_state.running.connect(fsm.change_State.bind(dino_running_state))

func on_obstacle_area_entered():
	fsm.change_State(dino_crashed_state)
