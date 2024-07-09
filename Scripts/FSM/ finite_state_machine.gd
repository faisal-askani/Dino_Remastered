class_name FiniteStateMachine extends Node

@export var _state: State

func _ready():
	change_State(_state)

func change_State(new_State: State):
	#To check if instance is not null and is State type
	if _state is State:
		_state._exit_state()
	new_State._enter_state()
	_state = new_State
