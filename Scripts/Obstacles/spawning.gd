class_name Spawning extends Node

@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var spawn_start_state = $FiniteStateMachine/SpawnStartState as SpawnStartState
@onready var spawn_stop_state = $FiniteStateMachine/SpawnStopState as SpawnStopState
@onready var dino = $"../Dino" as Dino

func _ready():
	dino.dino_idle_state.jump.connect(fsm.change_State.bind(spawn_start_state))
	dino.dino_crashed_state.crashed.connect(fsm.change_State.bind(spawn_stop_state))
