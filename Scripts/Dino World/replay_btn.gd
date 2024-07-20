extends TextureButton

@onready var _fsm = $"../../../FiniteStateMachine" as FiniteStateMachine
@onready var game_running_state = $"../../../FiniteStateMachine/GameRunningState" as GameRunningState

func _pressed():
	#get_tree().reload_current_scene()
	_fsm.change_State(game_running_state)
