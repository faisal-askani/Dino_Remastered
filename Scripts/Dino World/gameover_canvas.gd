extends CanvasLayer

@onready var gameover_container = $VBoxContainer

func _show_gameover():
	print("canvas layer start")
	gameover_container.show()

func _hide_gameover():
	print("canvas layer stop")
	gameover_container.hide()

func _ready():
	gameover_container.hide()

func _on_game_over_state_show_gameover():
	_show_gameover()

func _on_game_over_state_restart_game():
	_hide_gameover()
