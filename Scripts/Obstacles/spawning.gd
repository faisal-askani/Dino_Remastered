class_name Spawning extends Node

@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var spawn_start_state = $FiniteStateMachine/SpawnStartState as SpawnStartState
#@onready var spawn_stop_state = $FiniteStateMachine/SpawnStopState as SpawnStopState

#func _ready():
	#dino_idle_state.jump.connect(fsm.change_State.bind(dino_jump_state))
	#dino_running_state.jump.connect(fsm.change_State.bind(dino_jump_state))


#func _on_cactus_body_entered(body):
	#fsm.change_State(dino_crashed_state)
