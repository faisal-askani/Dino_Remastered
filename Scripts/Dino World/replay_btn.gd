extends TextureButton

@onready var _fsm = $"../../../FiniteStateMachine" as FiniteStateMachine
@onready var game_running_state = $"../../../FiniteStateMachine/GameRunningState" as GameRunningState
@onready var _sound_play = sound_player.get_node("SceneChangeAudioStream")

func _pressed():
	_sound_play.play()
	_fsm.change_State(game_running_state)
