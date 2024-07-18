extends CanvasLayer

@onready var gameover_label = $Label
@onready var replay_btn = $ReplayBtn

func _show_gameover():
	print("canvas layer start")
	gameover_label.show()
	replay_btn.show()

func _hide_gameover():
	print("canvas layer stop")
	gameover_label.hide()
	replay_btn.hide()

func _ready():
	gameover_label.hide()
	replay_btn.hide()

func _on_game_over_state_show_gameover():
	_show_gameover()
