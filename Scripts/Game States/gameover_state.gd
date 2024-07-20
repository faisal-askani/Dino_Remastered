class_name GameOverState extends State

signal stop_spawning
signal stop_manager
signal stop_background
signal show_gameover
signal stop_score
signal restart_game

func _enter_state():
	print("enter gameover state")
	stop_spawning.emit()
	stop_manager.emit()
	stop_background.emit()
	show_gameover.emit()
	stop_score.emit()

func _exit_state():
	print("exit gameover state")
	restart_game.emit()
