class_name World extends Node

@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var initial_state = $FiniteStateMachine/InitialState as InitialState
@onready var game_over_state = $FiniteStateMachine/GameOverState as GameOverState
@onready var game_running_state = $FiniteStateMachine/GameRunningState as GameRunningState
@onready var dino = $Dino as Dino
@onready var parallax_background = $ParallaxBackground


func _ready():
	dino.dino_idle_state.jump.connect(fsm.change_State.bind(game_running_state))
	dino.dino_crashed_state.crashed.connect(fsm.change_State.bind(game_over_state))

